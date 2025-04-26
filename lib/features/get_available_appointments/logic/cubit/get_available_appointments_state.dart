import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/models/get_available_appointments_response.dart';
part 'get_available_appointments_state.freezed.dart';
@freezed
class GetAvailableAppointmentsState<T> with _$GetAvailableAppointmentsState<T> {
  const factory GetAvailableAppointmentsState.initial() = _Initial;
  const factory GetAvailableAppointmentsState.loading() = Loading;
  const factory GetAvailableAppointmentsState.success(List<Appointment> appointments,
  ) = Success;
  const factory GetAvailableAppointmentsState.error(ApiErrorModel apiErrorModel) = Error;
    
}
