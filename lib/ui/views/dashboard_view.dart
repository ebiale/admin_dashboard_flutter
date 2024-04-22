import 'package:admin_dashboard/ui/cards/white_cart.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Dashboard view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        const WhiteCard(title: 'Test first card', child: Text('data'))
      ],
    );
  }
}
