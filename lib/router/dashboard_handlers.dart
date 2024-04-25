import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/views.dart';

class DashboardHandlers {
  static Handler dashboard =
      _buildHandler(const DashboardView(), Flurorouter.dashboardRoute);

  static Handler icons =
      _buildHandler(const IconsView(), Flurorouter.iconsRoute);

  static Handler blank =
      _buildHandler(const BlankView(), Flurorouter.blankRoute);

  static Handler categories =
      _buildHandler(const CategoriesView(), Flurorouter.categoriesRoute);

  static Handler users =
      _buildHandler(const UsersView(), Flurorouter.usersRoute);

  static Handler user = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.userRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      final String? uid = params['uid']?.first;
      if (uid != null) {
        return UserView(uid: uid);
      } else {
        return const UsersView();
      }
    }

    return const LoginView();
  });
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
