import 'dart:convert';

import 'package:admin_dashboard/models/http/users.dart';

class UsersResponse {
  int total;
  List<User> users;

  UsersResponse({
    required this.total,
    required this.users,
  });

  factory UsersResponse.fromJson(String str) =>
      UsersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        users: List<User>.from(json["usuarios"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "usuarios": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
