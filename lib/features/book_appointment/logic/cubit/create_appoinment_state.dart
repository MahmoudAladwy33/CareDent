import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'create_appoinment_state.freezed.dart';

@freezed
class CreateAppoinmentState<T> with _$CreateAppoinmentState<T> {
  const factory CreateAppoinmentState.initial() = _Initial;
  const factory CreateAppoinmentState.loading() = Loading;
  const factory CreateAppoinmentState.success(T data) = Success;
  const factory CreateAppoinmentState.error(ApiErrorModel apiErrorModel) =
      Error;
}
