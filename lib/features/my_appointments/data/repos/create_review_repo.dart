import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/create_review/create_review_request_body.dart';
import '../models/create_review/create_review_response.dart';

class CreateReviewRepo {
  final ApiService _apiService;

  CreateReviewRepo(this._apiService);

  Future<ApiResult<CreateReviewResponse>> createAppoinment(
    CreateReviewRequestBody createReviewRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.createReview(
        token,
        createReviewRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
