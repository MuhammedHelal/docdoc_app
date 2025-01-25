import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helpers/regex.dart';
import 'package:flutter_advanced/features/auth/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> emailValid = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordValid = ValueNotifier<bool>(false);
  ValueNotifier<bool> shouldLoginButtonWork = ValueNotifier<bool>(false);

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (data) {
      emit(LoginState.success(data));
    }, failure: (error) {
      emit(LoginState.failure(error));
    });
  }

  // String? validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Email can't be empty";
  //   } else if (!value.contains('@')) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }
  void validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      emailValid.value = false;
      shouldLoginButtonWork.value = false;
      return;
    }
    emailValid.value = AppRegex.isEmailValid(value);

    shouldLoginButtonWork.value = emailValid.value && passwordValid.value;
  }

  void validatePassword(String? pass) {
    if (pass == null || pass.isEmpty) {
      passwordValid.value = false;
      shouldLoginButtonWork.value = false;

      return;
    }
    final hasMinLength = pass.length >= 8;
    final hasUpperCase = AppRegex.hasUpperCase(pass);
    final hasLowerCase = AppRegex.hasLowerCase(pass);
    final hasNumber = AppRegex.hasNumber(pass);
    final hasSpecialCharacter = AppRegex.hasSpecialCharacter(pass);

    passwordValid.value = hasMinLength &&
        hasUpperCase &&
        hasLowerCase &&
        hasNumber &&
        hasSpecialCharacter;

    shouldLoginButtonWork.value = emailValid.value && passwordValid.value;
  }
}
