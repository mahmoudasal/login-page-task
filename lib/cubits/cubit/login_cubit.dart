import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));

    if (email == "test@example.com" && password == "password") {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure("Invalid email or password"));
    }
  }
}
