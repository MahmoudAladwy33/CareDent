import 'package:caredent/features/my_appointments/data/models/get_student_appointments/get_student_appointments_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class GetStudentAppointmentsRepo {
  final ApiService _apiService;

  GetStudentAppointmentsRepo(this._apiService);
  Future<ApiResult<GetStudentAppointmentsResponse>> getStudentAppointments(
    String token,
  ) async {
    try {
      final response = await _apiService.getStudentAppointments(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
