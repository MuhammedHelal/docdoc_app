import 'package:flutter_advanced/core/networking/api_error_handler.dart';
import 'package:flutter_advanced/core/networking/api_result.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/features/auth/data/models/signup_request_body.dart';
import 'package:flutter_advanced/features/auth/data/models/signup_response.dart';

class SignupRepo {
  final ApiService apiService;

  SignupRepo(this.apiService);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
