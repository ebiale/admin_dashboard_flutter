import 'package:flutter/material.dart';

import 'package:admin_dashboard/constants/system.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';

import 'package:admin_dashboard/ui/shared/widgets/nav_bar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          // burger icon
          if (size.width <= App.smallScreen)
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_outlined)),

          const SizedBox(width: 20),

          //search input
          if (size.width >= App.xsmallScreen)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),

          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavBarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
