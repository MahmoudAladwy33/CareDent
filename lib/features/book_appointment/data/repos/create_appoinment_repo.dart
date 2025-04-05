import 'package:caredent/features/book_appointment/data/models/create_appoinment_request_body.dart';
import 'package:caredent/features/book_appointment/data/models/create_appoinment_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class CreateAppoinmentRepo {
  final ApiService _apiService;

  CreateAppoinmentRepo(this._apiService);

  Future<ApiResult<CreateAppoinmentResponse>> createAppoinment(
    CreateAppoinmentRequestBody createAppoinmentRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.createAppointment(
        createAppoinmentRequestBody,
        token,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
