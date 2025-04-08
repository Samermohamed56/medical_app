class AuthRegister {
  final String message;

  AuthRegister({required this.message});

  factory AuthRegister.fromJson(Map<String, dynamic> json) {
    return AuthRegister(
      message: json['message'] ?? 'No message',
    );
  }
}