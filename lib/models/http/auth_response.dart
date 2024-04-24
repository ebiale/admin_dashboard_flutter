import 'dart:convert';

import 'package:admin_dashboard/models/http/users.dart';

class AuthResponse {
  User user;
  String token;

  AuthResponse({
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromRawJson(String str) =>
      AuthResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["usuario"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": user.toJson(),
        "token": token,
      };
}
