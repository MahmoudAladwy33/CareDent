import 'package:caredent/core/networking/api_result.dart';
import 'package:caredent/core/networking/api_service.dart';
import 'package:caredent/features/home/data/models/get_all_reviews_on_specific_student/get_all_reviews_on_specific_student_response.dart';
import '../../../../core/networking/api_error_handler.dart';

class GetAllReviewsOnSpecificStudentRepo {
  final ApiService _apiService;

  GetAllReviewsOnSpecificStudentRepo(this._apiService);

  Future<ApiResult<GetAllReviewsOnSpecificStudentResponse>> getAllReviewsOnSpecificStudent(
      String token, String studentId) async {
    try {
      final response = await _apiService.getAllReviewsOnSpecificStudent(
        token,
        studentId,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
