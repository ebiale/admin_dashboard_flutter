import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/background_app.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';

class DesktopBody extends StatelessWidget {
  final Widget child;
  const DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.9,
      child: Row(
        children: [
          const Expanded(child: BackgroundApp()),
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTitle(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}
