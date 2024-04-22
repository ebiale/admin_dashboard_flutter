import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
