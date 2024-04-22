import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String psw) {
    // todo: http request

    _token = "aasdf.qwesggdsf.gasdfqhweu";

    LocalStorage.prefs.setString('token', _token!);
    isAuthenticated();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: check token in BE

    await Future.delayed(const Duration(microseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
