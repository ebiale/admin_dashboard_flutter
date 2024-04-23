import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/constants/system.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';

import 'package:admin_dashboard/api/lenagurumis_api.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

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

  register(String email, String psw, String name) {
    final data = {'nombre': name, 'correo': email, 'password': psw};

    LGApi.post(API.users, data).then((json) {
      final authResponse = AuthResponse.fromJson(json);

      user = authResponse.user;
      LocalStorage.prefs.setString('token', authResponse.token);
      isAuthenticated();

      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    }).catchError((e) {
      print('Error in $e');
      //todo: display error notification
    });
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
