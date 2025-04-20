
import 'package:caredent/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_appoinment_state.freezed.dart';
@freezed
class DeleteAppoinmentState<T> with _$DeleteAppoinmentState<T> {
  const factory DeleteAppoinmentState.initial() = _Initial;
  const factory DeleteAppoinmentState.loading() = Loading;
  const factory DeleteAppoinmentState.success(T data) = Success;
  const factory DeleteAppoinmentState.error(ApiErrorModel apiErrorModel) = Error;
}
