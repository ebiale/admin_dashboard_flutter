import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String defaultRoute = '/';

  // auth routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // dashboard route
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    // Auth routes
    router.define(defaultRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register);

//Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    router.define('/test-404', handler: NoPageFoundHandlers.page404);

// 404
    router.notFoundHandler = NoPageFoundHandlers.page404;
  }
}
