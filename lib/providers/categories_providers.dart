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
      NotificationService.showSnackBarError('Error getting categories: $e');
    }
    notifyListeners();
  }
}
