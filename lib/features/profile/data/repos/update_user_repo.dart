import 'package:caredent/features/profile/data/models/update_user_request_body.dart';
import 'package:caredent/features/profile/data/models/update_user_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class UpdateUserRepo {
  final ApiService _apiService;

  UpdateUserRepo(this._apiService);

  Future<ApiResult<UpdateUserResponse>> updateUser(
    UpdateUserRequestBody updateUserRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.updateUser(
        token,
        updateUserRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
