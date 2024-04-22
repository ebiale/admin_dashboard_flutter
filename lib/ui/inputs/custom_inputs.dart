import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputStyles(
      {required String hint,
      required String label,
      required IconData icon,
      Color color = Colors.blue}) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)));
    OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: color.withOpacity(0.3)));

    MaterialColor textColor = Colors.grey;
    TextStyle textStyle = TextStyle(color: textColor);

    return InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: focusedOutlineInputBorder,
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: textColor,
        ),
        labelStyle: textStyle,
        hintStyle: textStyle);
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(vertical: 15),
    );
  }
}
