import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blue,
      this.isFilled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          side: MaterialStatePropertyAll(BorderSide(color: color)),
          backgroundColor: MaterialStatePropertyAll(
              isFilled ? color.withOpacity(0.3) : Colors.transparent)),
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
