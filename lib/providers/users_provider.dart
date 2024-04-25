import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/lenagurumis_api.dart';
import 'package:admin_dashboard/constants/system.dart';

import 'package:admin_dashboard/models/models.dart';

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

  Future<User?> getUserById(String uid) async {
    try {
      final resp = await LGApi.httpGet('${API.users}/$uid');
      return User.fromJson(resp);
    } catch (e) {
      return null;
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

  void refreshUser(User user) {
    final index = users.indexWhere((element) => element.uid == user.uid);
    if (index != -1) {
      users[index] = user;
    }
    notifyListeners();
  }
}
