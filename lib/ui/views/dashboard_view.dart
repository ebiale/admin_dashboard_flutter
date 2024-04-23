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
    print(user);

    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          'Dashboard view',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        WhiteCard(title: user!.name, child: Text(user.email))
      ],
    );
  }
}
