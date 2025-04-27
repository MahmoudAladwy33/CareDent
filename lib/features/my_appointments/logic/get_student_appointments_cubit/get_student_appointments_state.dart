import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../data/models/get_student_appointments/get_student_appointments_response.dart';
part 'get_student_appointments_state.freezed.dart';
@freezed
class GetStudentAppointmentsState<T> with _$GetStudentAppointmentsState<T> {
  const factory GetStudentAppointmentsState.initial() = _Initial;
  const factory GetStudentAppointmentsState.loading() = Loading;
  const factory GetStudentAppointmentsState.success(List<Order> orders) = Success;
  const factory GetStudentAppointmentsState.error(ApiErrorModel apiErrorModel) =
      Error;

}
