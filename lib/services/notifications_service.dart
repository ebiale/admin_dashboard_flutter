import 'package:admin_dashboard/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String msg) {
    final snackBar = SnackBar(
      backgroundColor: AppColors.error.withOpacity(0.9),
      content:
          Text(msg, style: const TextStyle(color: Colors.white, fontSize: 20)),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
