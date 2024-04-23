import 'dart:convert';

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

class User {
  String role;
  bool state;
  bool google;
  String name;
  String email;
  String uid;

  User({
    required this.role,
    required this.state,
    required this.google,
    required this.name,
    required this.email,
    required this.uid,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        role: json["rol"],
        state: json["estado"],
        google: json["google"],
        name: json["nombre"],
        email: json["correo"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "rol": role,
        "estado": state,
        "google": google,
        "nombre": name,
        "correo": email,
        "uid": uid,
      };
}
