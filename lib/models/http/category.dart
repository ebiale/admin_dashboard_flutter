import 'dart:convert';

class Category {
  String id;
  String name;
  CategoryUser user;

  Category({
    required this.id,
    required this.name,
    required this.user,
  });

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["nombre"],
        user: CategoryUser.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": name,
        "usuario": user.toMap(),
      };

  @override
  String toString() {
    return 'Category: $name';
  }
}

class CategoryUser {
  String id;
  String name;

  CategoryUser({
    required this.id,
    required this.name,
  });

  factory CategoryUser.fromJson(String str) =>
      CategoryUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryUser.fromMap(Map<String, dynamic> json) => CategoryUser(
        id: json["_id"],
        name: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": name,
      };
}
