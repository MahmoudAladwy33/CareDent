
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
part 'accept_appointment_state.freezed.dart';

@freezed
class AcceptAppointmentState<T> with _$AcceptAppointmentState<T> {
  const factory AcceptAppointmentState.initial() = _Initial;
  const factory AcceptAppointmentState.loading() = Loading;
    const factory AcceptAppointmentState.success(T data) = Success;
  const factory AcceptAppointmentState.error(ApiErrorModel apiErrorModel ) = Error;
}
