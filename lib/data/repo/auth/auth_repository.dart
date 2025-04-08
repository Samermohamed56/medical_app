import 'package:dio/dio.dart';
import 'package:medical/data/service/api_service.dart';

class AuthRepository {
  final Dio _dio = ApiService().dio;

  AuthRepository(Dio dio);

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/Auth/Login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data['message'] as String? ?? 'Login successful';
    } on DioException catch (e) {
      final msg = e.response?.data['message'] as String?;
      throw Exception(msg ?? 'Login failed');
    }
  }

  Future<String> registerUser({
    required String username,
    required String email,
    required String password,
    required String phone,
    required int age,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        '/Auth/Register',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'phone': phone,
          'age': age,
          'role': role,
        },
      );
      return response.data['message'] as String? ?? 'User registered successfully';
    } on DioException catch (e) {
      final msg = e.response?.data['message'] as String?;
      throw Exception(msg ?? 'Registration failed');
    }
  }
}
