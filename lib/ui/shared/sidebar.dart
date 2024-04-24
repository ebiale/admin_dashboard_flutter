import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/constants/colors.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 30),
          const TextSeparator(text: 'main'),
          MenuItem(
              isActive:
                  sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.dashboard_customize_outlined,
              onPressed: () {
                navigateTo(Flurorouter.dashboardRoute);
              }),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
              text: 'Users',
              icon: Icons.person_outlined,
              onPressed: () {
                navigateTo(Flurorouter.usersRoute);
              }),
          MenuItem(
              text: 'Collections',
              icon: Icons.category_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Categories',
              icon: Icons.auto_awesome_motion,
              onPressed: () {
                navigateTo(Flurorouter.categoriesRoute);
              }),
          MenuItem(text: 'Galery', icon: Icons.photo_library, onPressed: () {}),
          MenuItem(text: 'About me', icon: Icons.person, onPressed: () {}),
          MenuItem(text: 'FAQ', icon: Icons.help_outline, onPressed: () {}),
          MenuItem(
              text: 'Contact me', icon: Icons.mail_outline, onPressed: () {}),
          MenuItem(
              text: 'Testimonies', icon: Icons.rate_review, onPressed: () {}),
          MenuItem(text: 'Blog', icon: Icons.rss_feed, onPressed: () {}),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI elements'),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () {
                navigateTo(Flurorouter.iconsRoute);
              }),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          MenuItem(
              isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
              text: 'Blank',
              icon: Icons.post_add_outlined,
              onPressed: () {
                navigateTo(Flurorouter.blankRoute);
              }),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit'),
          MenuItem(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  void navigateTo(String route) {
    NavigationService.replaceTo(route);
    SideMenuProvider.closeMenu();
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        AppColors.primary,
        AppColors.secondary,
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
