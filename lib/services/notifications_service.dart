import 'package:flutter/material.dart';
import 'package:admin_dashboard/constants/colors.dart';

enum NotificationType { error, warning, success, info }

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final Map<NotificationType, Color> _snackBarColors = {
    NotificationType.error: AppColors.error.withOpacity(0.5),
    NotificationType.warning: Colors.orangeAccent,
    NotificationType.success: Colors.green,
    NotificationType.info: AppColors.primary,
  };

  static showSnackBarMsg(String msg, NotificationType type) {
    final snackBar = SnackBar(
      backgroundColor: _snackBarColors[type],
      content:
          Text(msg, style: const TextStyle(color: Colors.white, fontSize: 20)),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showLoadingIndicator(BuildContext context) {
    const AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    showDialog(context: context, builder: (_) => dialog);
  }
}
