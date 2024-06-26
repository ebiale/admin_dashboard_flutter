import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/cards/white_cart.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Dashboard view',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          WhiteCard(
              title: '${user!.name} (${user.role})', child: Text(user.email))
        ],
      ),
    );
  }
}
