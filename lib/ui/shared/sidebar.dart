import 'package:admin_dashboard/constants/colors.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
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
              text: 'Dashboard',
              icon: Icons.dashboard_customize_outlined,
              onPressed: () {
                SideMenuProvider.closeMenu();
              }),
          MenuItem(
              text: 'Collections',
              icon: Icons.category_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Patterns',
              icon: Icons.auto_awesome_motion,
              onPressed: () {}),
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
              text: 'Icons', icon: Icons.list_alt_outlined, onPressed: () {}),
          MenuItem(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () {}),
          MenuItem(
              text: 'Blank', icon: Icons.post_add_outlined, onPressed: () {}),
          MenuItem(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        AppColors.primary,
        AppColors.secondary,
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
