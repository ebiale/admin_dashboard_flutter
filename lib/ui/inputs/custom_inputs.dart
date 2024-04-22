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
}
