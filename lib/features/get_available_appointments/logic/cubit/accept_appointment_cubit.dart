import 'package:caredent/features/get_available_appointments/data/models/accept_appointmet_request_body.dart';
import 'package:caredent/features/get_available_appointments/data/repos/accept_appointment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'accept_appointment_state.dart';

class AcceptAppointmentCubit extends Cubit<AcceptAppointmentState> {
  AcceptAppointmentCubit(this._acceptAppointmentRepo)
    : super(AcceptAppointmentState.initial());
  final AcceptAppointmentRepo _acceptAppointmentRepo;

  void emitAcceptAppoinmentStates(
    String appointmentId,
    String date,
    String time,
  ) async {
    emit(const AcceptAppointmentState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _acceptAppointmentRepo.acceptAppoinment(
      AcceptAppointmetRequestBody(
        appointmentId: appointmentId,
        date: date,
        time: time,
      ),
      token,
    );
    response.when(
      success: (acceptAppointmentResponse) async {
        emit(AcceptAppointmentState.success(acceptAppointmentResponse));
      },
      failure: (apiErrorModel) {
        emit(AcceptAppointmentState.error(apiErrorModel));
      },
    );
  }
}
