import 'package:caredent/features/login/data/models/create_new_password/create_new_password_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/create_new_password/create_new_password_request_body.dart';

class CreateNewPasswordRepo {
  final ApiService _apiService;

  CreateNewPasswordRepo(this._apiService);

  Future<ApiResult<CreateNewPasswordResponse>> createNewPassword(
    CreateNewPasswordRequestBody createNewPasswordRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.createNewPassword(
        token,
        createNewPasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
