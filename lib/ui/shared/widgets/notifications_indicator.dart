import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(Icons.notifications_none_outlined, color: Colors.grey),
        Positioned(
          left: 14,
          bottom: 3,
          child: Container(
            width: 7,
            height: 7,
            decoration: buildBoxDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.red, borderRadius: BorderRadius.circular(100));
}
