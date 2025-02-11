import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;

  final String phone;
  final num gender;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  SignupRequestBody({
    required this.name,
    required this.phone,
    required this.gender,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
