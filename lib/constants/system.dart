class App {
  static const int smallScreen = 700;
  static const int xsmallScreen = 440;

  static Duration animationDuration = const Duration(milliseconds: 350);
}

class API {
  static const String baseUrl = 'http://localhost:8080/api';
  static const String auth = '/auth';
  static const String login = '$auth/login';
  static const String users = '/usuarios';
  static const String paginatedUsers = '$users?limite=10&desde=0';
  static const String categories = '/categorias';
  static const String uploadImage = '/uploads/usuarios';
}
