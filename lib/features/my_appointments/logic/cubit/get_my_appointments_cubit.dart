import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/repos/get_my_appointments_repo.dart';
import 'get_my_appointments_state.dart';

class GetMyAppointmentsCubit extends Cubit<GetMyAppointmentsState> {
  GetMyAppointmentsCubit(this._getMyAppointmentsRepo)
    : super(GetMyAppointmentsState.initial());
  final GetMyAppointmentsRepo _getMyAppointmentsRepo;

  void getMyAppointments() async {
    emit(GetMyAppointmentsState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _getMyAppointmentsRepo.getMyAppointments(token);
    response.when(
      success: (getMyAppointmentsResponse) {
        emit(GetMyAppointmentsState.success(getMyAppointmentsResponse.orders));
      },
      failure: (apiErrorModel) {
        emit(GetMyAppointmentsState.error(apiErrorModel));
      },
    );
  }
}
