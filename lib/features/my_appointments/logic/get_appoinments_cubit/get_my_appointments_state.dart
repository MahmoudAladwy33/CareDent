import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../data/models/get_appoinments/get_my_appointments_response.dart';
part 'get_my_appointments_state.freezed.dart';
@freezed
class GetMyAppointmentsState<T> with _$GetMyAppointmentsState<T> {
  const factory GetMyAppointmentsState.initial() = _Initial;
  const factory GetMyAppointmentsState.loading() = Loading;
  const factory GetMyAppointmentsState.success(List<Order> orders) = Success;
  const factory GetMyAppointmentsState.error(ApiErrorModel apiErrorModel) = Error;

}
