import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/background_app.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';

class MobileBody extends StatelessWidget {
  final Widget child;
  const MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 420,
            child: BackgroundApp(),
          )
        ],
      ),
    );
  }
}
