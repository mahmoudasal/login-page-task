import 'package:bloc/bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 2));

    if (_validateEmail(email) == null && _validatePassword(password) == null) {
      if (email == "test@example.com" && password == "password") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid email or password"));
      }
    } else {
      emit(LoginFailure("Please enter valid email and password"));
    }
  }

  String? _validateEmail(String? value) {
    const emailRegex =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
