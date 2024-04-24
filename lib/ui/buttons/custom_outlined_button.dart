import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color bgColor;
  final bool isFilled;
  final Color textColor;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.bgColor = Colors.blue,
      this.textColor = Colors.grey,
      this.isFilled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          side: MaterialStatePropertyAll(BorderSide(color: bgColor)),
          backgroundColor: MaterialStatePropertyAll(
              isFilled ? bgColor.withOpacity(0.3) : Colors.transparent)),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
