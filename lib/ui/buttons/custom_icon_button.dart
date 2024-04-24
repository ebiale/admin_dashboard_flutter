import 'package:admin_dashboard/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool isFilled;
  final IconData icon;
  final bool disabled;

  const CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon,
      this.color = AppColors.primary,
      this.textColor = Colors.white,
      this.isFilled = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(color.withOpacity(0.5)),
          overlayColor: MaterialStatePropertyAll(color.withOpacity(0.3)),
          side: MaterialStatePropertyAll(BorderSide(color: color))),
      onPressed: () => onPressed(),
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
