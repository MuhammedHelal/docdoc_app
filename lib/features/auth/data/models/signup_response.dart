import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  bool? status;
  num? code;

  SignupResponse({
    this.message,
    this.status,
    this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class SignupData {
  String? token;
  @JsonKey(name: 'username')
  String? userName;

  SignupData({this.token, this.userName});

  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);
}
