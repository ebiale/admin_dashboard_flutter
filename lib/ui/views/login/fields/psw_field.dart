import 'package:admin_dashboard/helpers/validators.dart';
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
      validator: Validators.passwordValidator,
      style: const TextStyle(color: Colors.white),
      decoration: CustomInputs.loginInputStyles(
          hint: '*********',
          label: 'Password',
          icon: Icons.lock_outline_rounded),
    );
  }
}
