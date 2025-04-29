import 'package:caredent/core/networking/api_error_model.dart';
import 'package:caredent/features/home/data/models/get_reports/get_reports_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_reports_state.freezed.dart';
@freezed
class GetReportsState<T> with _$GetReportsState<T> {
  const factory GetReportsState.initial() = _Initial;
  const factory GetReportsState.loading() = Loading;
  const factory GetReportsState.success(List<Report> reports) = Success;
  const factory GetReportsState.error(ApiErrorModel apiErrorModel) = Error;
}
