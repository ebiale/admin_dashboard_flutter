import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.onChanged,
    required this.onFieldSubmitted,
  });

  final void Function(String) onChanged;
  final void Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }

        if (!EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }

        return null;
      },
      style: const TextStyle(color: Colors.white),
      decoration: CustomInputs.loginInputStyles(
          hint: 'Enter your email', label: 'Email', icon: Icons.email_outlined),
    );
  }
}
