import 'package:flutter/material.dart';

import 'package:admin_dashboard/helpers/image_helper.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackgroundImage(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage(ImageHelper.getImagePath('lg4.png')),
              width: 400,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() => BoxDecoration(
      image: DecorationImage(
          image: AssetImage(ImageHelper.getImagePath('bg.png')),
          fit: BoxFit.cover));
}
