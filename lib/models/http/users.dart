import 'dart:convert';

class User {
  String role;
  bool state;
  bool google;
  String name;
  String email;
  String uid;
  String? img;

  User(
      {required this.role,
      required this.state,
      required this.google,
      required this.name,
      required this.email,
      required this.uid,
      this.img});

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
