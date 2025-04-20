import 'package:caredent/core/networking/api_service.dart';
import 'package:caredent/features/my_appointments/data/models/delete_appoinment/delete_appoinment_response.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class DeleteAppointmentRepo {
  final ApiService _apiService;

  DeleteAppointmentRepo(this._apiService);

   Future<ApiResult<DeleteAppoinmentResponse>> deleteAppoinment(
    String id,
    String token,
  ) async {
    try {
      final response = await _apiService.deleteAppointment(
        token,
        id,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
