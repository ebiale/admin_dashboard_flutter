import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String psw = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email === $psw === $name');
      return true;
    }

    return false;
  }
}
