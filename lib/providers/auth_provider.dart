import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/constants/system.dart';

import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/http/users.dart';

import 'package:admin_dashboard/api/lenagurumis_api.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

  AuthProvider() {
    _isAuthenticated();
  }

  login(String email, String psw) {
    final data = {'correo': email, 'password': psw};
    _authenticateAndLogin(API.login, data);
  }

  register(String email, String psw, String name) {
    final data = {'nombre': name, 'correo': email, 'password': psw};

    _authenticateAndLogin(API.users, data);
  }

  void _authenticateAndLogin(String api, Map<String, String> data) {
    LGApi.post(api, data).then((json) {
      final authResponse = AuthResponse.fromJson(json);

      user = authResponse.user;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      LGApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      NotificationService.showSnackBarMsg('$e', NotificationType.error);
    });
  }

  Future<bool> _isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      logout();
      return false;
    }

    try {
      final resp = await LGApi.httpGet(API.auth);
      final authResponse = AuthResponse.fromJson(resp);

      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.user;
      authStatus = AuthStatus.authenticated;
      LGApi.configureDio();
      notifyListeners();

      return true;
    } catch (e) {
      logout();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
