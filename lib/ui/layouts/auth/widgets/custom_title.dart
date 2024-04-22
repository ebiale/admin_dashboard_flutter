import 'package:flutter/material.dart';

import 'package:admin_dashboard/helpers/image_helper.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageHelper.getImagePath('lg4.png'),
                height: 90,
              ),
              const SizedBox(
                width: 20,
              ),
              const FittedBox(
                fit: BoxFit.contain,
                child: Text('LenaGurumis Store',
                    style: TextStyle(
                      fontFamily: 'ButteyHoney',
                      color: Colors.white,
                      fontSize: 60,
                    )),
              )
            ],
          )),
    );
  }
}
