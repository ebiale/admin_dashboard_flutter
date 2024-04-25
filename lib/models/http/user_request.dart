class UserRequest {
  static Map<String, dynamic> toJson(String name, String email) => {
        "nombre": name,
        "correo": email,
      };
}
