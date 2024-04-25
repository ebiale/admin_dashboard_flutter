import 'package:email_validator/email_validator.dart';

class Validators {
  static String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    RegExp regex = RegExp('[\'"\\/]');

    if (value.contains(regex)) {
      return 'Password contains invalid characters';
    }

    return null;
  }

  static String? userValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the user name';
    }

    if (value.length < 2) {
      return 'The name must be at least 2 characters long';
    }

    return null;
  }
}
