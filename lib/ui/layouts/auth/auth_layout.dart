import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/desktop_body.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/mobile_body.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            (size.width > 1000)
                ? DesktopBody(child: child)
                : MobileBody(
                    child: child,
                  ),

            //Mobile

            //LinksBar
            const LinksBar()
          ],
        ),
      ),
    );
  }
}
