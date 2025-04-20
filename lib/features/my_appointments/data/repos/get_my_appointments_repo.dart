import 'package:caredent/features/my_appointments/data/models/get_my_appointments_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class GetMyAppointmentsRepo {
  final ApiService _apiService;

  GetMyAppointmentsRepo(this._apiService);
  Future<ApiResult<GetMyAppointmentsResponse>> getMyAppointments(
    String token,
  ) async {
    try {
      final response = await _apiService.getMyAppointments(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
