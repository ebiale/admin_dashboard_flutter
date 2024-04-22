import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String psw = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    }

    return false;
  }
}
