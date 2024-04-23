import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.onChanged,
    required this.onFieldSubmitted,
  });

  final void Function(String) onChanged;
  final void Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
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
      },
      style: const TextStyle(color: Colors.white),
      decoration: CustomInputs.loginInputStyles(
          hint: '*********',
          label: 'Password',
          icon: Icons.lock_outline_rounded),
    );
  }
}
