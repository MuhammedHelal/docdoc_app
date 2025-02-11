import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;

  const factory SignupState.loading() = Loading;
  const factory SignupState.success(T data) = success<T>;
  const factory SignupState.failure(ErrorHandler error) = failure;
}
