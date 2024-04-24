class App {
  static const int smallScreen = 700;
  static const int xsmallScreen = 440;

  static Duration animationDuration = const Duration(milliseconds: 350);
}

class API {
  static const String users = '/usuarios';
  static const String login = '/auth/login';
  static const String auth = '/auth';
  static const String categories = '/categorias';
}
