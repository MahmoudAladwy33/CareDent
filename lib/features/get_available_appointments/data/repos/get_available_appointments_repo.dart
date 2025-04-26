import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/get_available_appointments_response.dart';

class GetAvailableAppointmentsRepo {
  final ApiService _apiService;

  GetAvailableAppointmentsRepo(this._apiService);
  Future<ApiResult<GetAvailableAppointmentsResponse>> getAvailableAppointments(
    String token,
  ) async {
    try {
      final response = await _apiService.getAvailableAppointments(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
