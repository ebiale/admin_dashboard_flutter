import 'package:flutter/material.dart';

import 'package:admin_dashboard/helpers/validators.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

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
      validator: Validators.emailValidator,
      style: const TextStyle(color: Colors.white),
      decoration: CustomInputs.loginInputStyles(
          hint: 'Enter your email', label: 'Email', icon: Icons.email_outlined),
    );
  }
}
