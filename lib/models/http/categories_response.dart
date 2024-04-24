import 'dart:convert';

import 'package:admin_dashboard/models/http/category.dart';

class CategoriesResponse {
  int total;
  List<Category> categories;

  CategoriesResponse({
    required this.total,
    required this.categories,
  });

  factory CategoriesResponse.fromJson(String str) =>
      CategoriesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        total: json["total"],
        categories: List<Category>.from(
            json["categorias"].map((x) => Category.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categories.map((x) => x.toMap())),
      };
}
