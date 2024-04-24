import 'package:flutter/material.dart';

import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/api/lenagurumis_api.dart';

import 'package:admin_dashboard/constants/system.dart';

import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categories = [];

  getCategories() async {
    try {
      final resp = await LGApi.httpGet(API.categories);
      final categoriesResponse = CategoriesResponse.fromMap(resp);

      categories = [...categoriesResponse.categories];
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error getting categories: $e', NotificationType.error);
    }
    notifyListeners();
  }

  Future addCategory(String name) async {
    final data = {'nombre': name};
    try {
      final resp = await LGApi.post(API.categories, data);
      final category = Category.fromMap(resp);

      categories.add(category);
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully added category: $name', NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error adding category: $name', NotificationType.error);
    }
  }

  Future editCategory(String newName, String id) async {
    final data = {'nombre': newName};
    final String url = '${API.categories}/$id';

    try {
      await LGApi.put(url, data);

      final index = categories.indexWhere((element) => element.id == id);
      if (index != -1) {
        categories[index].name = newName;
      }
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully edited category: $newName', NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error updating category', NotificationType.error);
    }
  }

  Future removeCategory(Category category) async {
    try {
      await LGApi.delete('${API.categories}/${category.id}');
      categories.removeWhere((element) => element.id == category.id);
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully removed category: ${category.name}',
          NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error deleting category: $category.name', NotificationType.error);
    }
  }
}
