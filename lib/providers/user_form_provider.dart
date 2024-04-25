import 'package:admin_dashboard/api/lenagurumis_api.dart';
import 'package:admin_dashboard/constants/system.dart';
import 'package:admin_dashboard/models/http/user_request.dart';
import 'package:admin_dashboard/models/http/users.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  User? user;
  late GlobalKey<FormState> formKey;

  copyUserWith(
      {String? role,
      bool? state,
      bool? google,
      String? name,
      String? email,
      String? uid,
      String? img}) {
    user = User(
        role: role ?? user!.role,
        state: state ?? user!.state,
        google: google ?? user!.google,
        name: name ?? user!.name,
        email: email ?? user!.email,
        uid: uid ?? user!.uid,
        img: img ?? user!.img);

    notifyListeners();
  }

  Future<bool> updateUser() async {
    if (!_validateForm()) return false;

    final data = UserRequest.toJson(user!.name, user!.email);

    try {
      await LGApi.put('${API.users}/${user!.uid}', data);
      return true;
    } catch (e) {
      NotificationService.showSnackBarMsg(
          'Error updading user', NotificationType.error);
      return false;
    }
  }

  bool _validateForm() {
    return formKey.currentState!.validate();
  }
}
