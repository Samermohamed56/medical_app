import 'package:bloc/bloc.dart';
import 'package:medical/data/repo/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository authRepository;

  SignupCubit(this.authRepository) : super(SignupInitial());

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required String phone,
    required int age,
    required String role,
  }) async {
    emit(SignupLoading());
    try {
      final message = await authRepository.registerUser(
        username: username,
        email: email,
        password: password,
        phone: phone,
        age: age,
        role: role,
      );
      emit(SignupSuccess(message));
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
