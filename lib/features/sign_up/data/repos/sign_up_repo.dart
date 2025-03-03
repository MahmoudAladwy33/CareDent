import 'package:caredent/core/networking/api_error_handler.dart';
import 'package:caredent/core/networking/api_result.dart';
import 'package:caredent/core/networking/api_service.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_request_body.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ApiErrorHandler.handle(errro));
    }
  }
}
