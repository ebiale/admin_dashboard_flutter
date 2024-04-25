import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';

import '../ui/views/views.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    return returnView(context, const LoginView());
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    return returnView(context, const RegisterView());
  });

  static StatelessWidget returnView(
      BuildContext? context, StatelessWidget view) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return view;
    }

    return const DashboardView();
  }
}
