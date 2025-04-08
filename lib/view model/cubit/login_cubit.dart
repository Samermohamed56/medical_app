import 'package:bloc/bloc.dart';
import 'package:medical/data/repo/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final message = await authRepository.loginUser(
        email: email,
        password: password,
      );
      emit(LoginSuccess(message));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
