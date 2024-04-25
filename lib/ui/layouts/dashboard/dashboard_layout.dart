import 'package:flutter/material.dart';

import 'package:admin_dashboard/constants/constants.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';

import 'package:admin_dashboard/ui/shared/nav_bar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SideMenuProvider.menuControler =
        AnimationController(vsync: this, duration: App.animationDuration);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width > App.smallScreen) const SideBar(),
              Expanded(
                child: Column(
                  children: [
                    //nav var
                    const NavBar(),
                    //view container
                    Expanded(child: widget.child),
                  ],
                ),
              )
            ],
          ),
          if (size.width <= App.smallScreen)
            AnimatedBuilder(
                animation: SideMenuProvider.menuControler,
                builder: (context, _) => Stack(
                      children: [
                        if (SideMenuProvider.isOpen)
                          Opacity(
                            opacity: SideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(SideMenuProvider.movement.value, 0),
                          child: const SideBar(),
                        )
                      ],
                    ))
        ],
      ),
    );
  }
}
