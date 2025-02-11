import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/helpers/regex.dart';
import 'package:flutter_advanced/features/auth/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/auth/data/repos/signup_repo.dart';
import 'package:flutter_advanced/features/auth/logic/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(const SignupState.initial());
  final SignupRepo signupRepo;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedGender = 0;
  String phone = '';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  ValueNotifier<bool> emailValid = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordValid = ValueNotifier<bool>(false);
  ValueNotifier<bool> confirmPasswordValid = ValueNotifier<bool>(false);

  ValueNotifier<bool> shouldLoginButtonWork = ValueNotifier<bool>(false);
  void emitSignupState() async {
    emit(const SignupState.loading());

    final SignupRequestBody signupRequestBody = SignupRequestBody(
      phone: phone,
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: confirmPasswordController.text,
      gender: 0,
    );
    final response = await signupRepo.signup(signupRequestBody);

    response.when(success: (data) {
      emit(SignupState.success(data));
    }, failure: (error) {
      emit(SignupState.failure(error));
    });
  }

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

  void validateConfirmPassword() {
    final pass = passwordController.text;
    final confirmPass = confirmPasswordController.text;
    confirmPasswordValid.value = pass == confirmPass;
  }
}
