import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.height * 0.1,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
            // ignore: avoid_print
            onPressed: () => print('about'),
          ),
          const LinkText(text: 'Facebook'),
          const LinkText(text: 'Instagram'),
          const LinkText(text: 'Etsy Store'),
          const LinkText(text: 'Ravelry Store'),
          const LinkText(text: 'Blog'),
          const LinkText(text: 'Colections'),
        ],
      ),
    );
  }
}
