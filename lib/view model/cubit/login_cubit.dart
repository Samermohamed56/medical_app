import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical/view%20model/failures.dart';
import 'package:dio/dio.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Dio dio = Dio();

  void login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      Response response = await dio.post(
        'https://mvmwebapp-freph8bvg6euapa3.uaenorth-01.azurewebsites.net/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        // بدل ما تستخدم رسالة عامة هنا، زي "Login failed"
        emit(LoginFailure('Error: ${response.data['Message'] ?? 'Unknown error'}'));
      }
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioError(e);
      emit(LoginFailure(failure.errmessage));
    } catch (e, stack) {
      debugPrint('Unhandled error: $e');
      debugPrintStack(stackTrace: stack);
      emit(LoginFailure('Unexpected error: $e'));
    }
  }
}
