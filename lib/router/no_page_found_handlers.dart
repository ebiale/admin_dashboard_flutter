import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_found.dart';

class NoPageFoundHandlers {
  static Handler page404 = Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('404');

    return const NoPageFoundView();
  });
}
