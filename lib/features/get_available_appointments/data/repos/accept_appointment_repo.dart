import 'package:caredent/features/get_available_appointments/data/models/accept_appointment_response.dart';
import 'package:caredent/features/get_available_appointments/data/models/accept_appointmet_request_body.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class AcceptAppointmentRepo {
  final ApiService _apiService;

  AcceptAppointmentRepo(this._apiService);

  Future<ApiResult<AcceptAppointmentResponse>> acceptAppoinment(
    AcceptAppointmetRequestBody acceptAppointmetRequestBody,
    String token,
  ) async {
    try {
      final response = await _apiService.acceptAppointment(
        token,
        acceptAppointmetRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
