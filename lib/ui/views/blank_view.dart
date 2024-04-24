import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/cards/white_cart.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Blank view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(title: 'Test first card', child: Text('data'))
        ],
      ),
    );
  }
}
