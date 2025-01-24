import 'package:flutter_advanced/features/auth/data/models/login_request_body.dart';
import 'package:flutter_advanced/features/auth/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/auth/logic/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final LoginRepo _loginRepo;
  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);

    response.when(success: (data) {
      emit(LoginState.success(data));
    }, failure: (error) {
      emit(LoginState.failure(error));
    });
  }
}
