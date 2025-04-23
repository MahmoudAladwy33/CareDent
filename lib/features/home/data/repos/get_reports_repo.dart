import 'package:caredent/features/home/data/models/get_reports/get_reports_model.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class GetReportsRepo {
  final ApiService _apiService;

  GetReportsRepo(this._apiService);
  Future<ApiResult<GetReportsResponse>> getReports(String token) async {
    try {
      final response = await _apiService.getReports(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
