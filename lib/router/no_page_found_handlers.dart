import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/no_page_found.dart';

class NoPageFoundHandlers {
  static Handler page404 = Handler(handlerFunc: (context, params) {
    return const NoPageFoundView();
  });
}
