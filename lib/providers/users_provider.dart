import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/lenagurumis_api.dart';
import 'package:admin_dashboard/constants/system.dart';

import 'package:admin_dashboard/models/http/users.dart';
import 'package:admin_dashboard/models/http/users_response.dart';

import 'package:admin_dashboard/services/notifications_service.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider() {
    getPaginatedUsers();
  }

  void sort<T>(Comparable<T> Function(User user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }

  Future<User> getUserById(String uid) async {
    try {
      final resp = await LGApi.httpGet('${API.users}/$uid');
      return User.fromJson(resp);
    } catch (e) {
      rethrow;
    }
  }

  getPaginatedUsers() async {
    try {
      final resp = await LGApi.httpGet(API.paginatedUsers);
      final usersResponse = UsersResponse.fromMap(resp);

      users = [...usersResponse.users];

      isLoading = false;

      notifyListeners();
    } on Exception catch (e) {
      NotificationService.showSnackBarMsg(
          'Error getting users: $e', NotificationType.error);
    }
  }

  Future addUser(String name) async {
    final data = {'nombre': name};
    try {
      final resp = await LGApi.post(API.users, data);
      final user = User.fromJson(resp);

      users.add(user);
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully added user: $name', NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error adding user: $name', NotificationType.error);
    }
  }

  Future editUser(String newName, String id) async {
    final data = {'nombre': newName};
    final String url = '${API.users}/$id';

    try {
      await LGApi.put(url, data);

      final index = users.indexWhere((element) => element.uid == id);
      if (index != -1) {
        users[index].name = newName;
      }
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully edited user: $newName', NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error updating user', NotificationType.error);
    }
  }

  Future removeUser(User user) async {
    try {
      await LGApi.delete('${API.users}/${user.uid}');
      users.removeWhere((element) => element.uid == user.uid);
      notifyListeners();
      NotificationService.showSnackBarMsg(
          'Successfully removed user: ${user.name}', NotificationType.success);
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error deleting user: $user.name', NotificationType.error);
    }
  }
}
