import 'package:admin_dashboard/ui/cards/white_cart.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              title: 'Home',
              width: 170,
              child: Center(child: Icon(Icons.home)),
            ),
            WhiteCard(
              title: 'Business',
              width: 170,
              child: Center(child: Icon(Icons.business)),
            ),
            WhiteCard(
              title: 'Settings',
              width: 170,
              child: Center(child: Icon(Icons.settings)),
            ),
            WhiteCard(
              title: 'Notifications',
              width: 170,
              child: Center(child: Icon(Icons.notifications)),
            ),
            WhiteCard(
              title: 'Favorite',
              width: 170,
              child: Center(child: Icon(Icons.favorite_border)),
            ),
            WhiteCard(
              title: 'Profile',
              width: 170,
              child: Center(child: Icon(Icons.person)),
            ),
            WhiteCard(
              title: 'Shopping Cart',
              width: 170,
              child: Center(child: Icon(Icons.shopping_cart)),
            ),
            WhiteCard(
              title: 'Camera',
              width: 170,
              child: Center(child: Icon(Icons.camera_alt)),
            ),
            WhiteCard(
              title: 'Send',
              width: 170,
              child: Center(child: Icon(Icons.send)),
            ),
            WhiteCard(
              title: 'Map',
              width: 170,
              child: Center(child: Icon(Icons.map)),
            ),
          ],
        )
      ],
    );
  }
}
