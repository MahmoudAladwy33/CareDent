import 'dart:developer';

import 'package:caredent/features/my_appointments/data/repos/get_student_appointments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'get_student_appointments_state.dart';

class GetStudentAppointmentsCubit extends Cubit<GetStudentAppointmentsState> {
  GetStudentAppointmentsCubit(this._getStudentAppointmentsRepo)
    : super(GetStudentAppointmentsState.initial());
  final GetStudentAppointmentsRepo _getStudentAppointmentsRepo;

  void getStudentAppointments() async {
    emit(GetStudentAppointmentsState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _getStudentAppointmentsRepo.getStudentAppointments(
      token,
    );
    response.when(
      success: (getStudentAppointmentsResponse) {
        log(
          'message: '
          'Success state: ${getStudentAppointmentsResponse.orders}',
        );
        emit(
          GetStudentAppointmentsState.success(
            getStudentAppointmentsResponse.orders,
          ),
        );
      },
      failure: (apiErrorModel) {
        emit(GetStudentAppointmentsState.error(apiErrorModel));
      },
    );
  }
}
