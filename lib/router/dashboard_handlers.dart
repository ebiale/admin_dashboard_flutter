import 'package:admin_dashboard/ui/views/categories_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login/login_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';

class DashboardHandlers {
  static Handler dashboard =
      _buildHandler(const DashboardView(), Flurorouter.dashboardRoute);

  static Handler icons =
      _buildHandler(const IconsView(), Flurorouter.iconsRoute);

  static Handler blank =
      _buildHandler(const BlankView(), Flurorouter.blankRoute);

  static Handler categories =
      _buildHandler(const CategoriesView(), Flurorouter.categoriesRoute);
}

Handler _buildHandler(view, String route) {
  return Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(route);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return view;
    }

    return const LoginView();
  });
}
