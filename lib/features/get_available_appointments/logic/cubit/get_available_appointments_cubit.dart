import 'package:caredent/features/get_available_appointments/data/repos/get_available_appointments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'get_available_appointments_state.dart';

class GetAvailableAppointmentsCubit
    extends Cubit<GetAvailableAppointmentsState> {
  GetAvailableAppointmentsCubit(this._getAvailableAppointmentsRepo)
    : super(GetAvailableAppointmentsState.initial());

  final GetAvailableAppointmentsRepo _getAvailableAppointmentsRepo;

  void getAvailableAppointments() async {
    emit(GetAvailableAppointmentsState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _getAvailableAppointmentsRepo
        .getAvailableAppointments(token);
    response.when(
      success: (getAvailableAppointmentsResponse) {
        emit(
          GetAvailableAppointmentsState.success(
            getAvailableAppointmentsResponse.orders,
          ),
        );
      },
      failure: (apiErrorModel) {
        emit(GetAvailableAppointmentsState.error(apiErrorModel));
      },
    );
  }
}
