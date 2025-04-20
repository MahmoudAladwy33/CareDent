import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/repos/delete_appointment_repo.dart';
import 'delete_appoinment_state.dart';

class DeleteAppoinmentCubit extends Cubit<DeleteAppoinmentState> {
  DeleteAppoinmentCubit(this._deleteAppointmentRepo)
    : super(DeleteAppoinmentState.initial());
  final DeleteAppointmentRepo _deleteAppointmentRepo;

  void emitDeletAppoinmentStates(String appointmentId) async {
    emit(DeleteAppoinmentState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _deleteAppointmentRepo.deleteAppoinment(
      appointmentId,
      token,
    );
    response.when(
      success: (deleteAppoinmentResponse) async {
        emit(DeleteAppoinmentState.success(deleteAppoinmentResponse));
      },
      failure: (apiErrorModel) {
        emit(DeleteAppoinmentState.error(apiErrorModel));
      },
    );
  }
}
