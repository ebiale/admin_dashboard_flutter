import 'package:flutter/material.dart';
import 'package:admin_dashboard/helpers/image_helper.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image(
        image: AssetImage(ImageHelper.getImagePath('bella.jpg')),
        width: 30,
        height: 30,
      ),
    );
  }
}
