class AuthLogin {
  final int id;
  final String role;

  AuthLogin({required this.id, required this.role});

  factory AuthLogin.fromJson(Map<String, dynamic> json) {
    return AuthLogin(
      id: json['id'],
      role: json['role'],
    );
  }
}
