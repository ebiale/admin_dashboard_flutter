import 'package:admin_dashboard/helpers/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(ImageHelper.getImagePath('lg5.png')),
            width: 40,
          ),
          Text(
            'LenaGurumis',
            style: GoogleFonts.montserratAlternates(
                fontSize: 20, fontWeight: FontWeight.w200, color: Colors.white),
          )
        ],
      ),
    );
  }
}
