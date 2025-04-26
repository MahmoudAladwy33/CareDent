import 'package:caredent/features/get_available_appointments/data/models/get_available_appointments_response.dart';
import 'package:caredent/features/get_available_appointments/logic/cubit/get_available_appointments_cubit.dart';
import 'package:caredent/features/get_available_appointments/ui/widgets/available_appointments_requests_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/get_available_appointments_state.dart';
import 'available_appointments_list_view_skel.dart';

class GetAvailableAppointmentsBlocBuilder extends StatelessWidget {
  const GetAvailableAppointmentsBlocBuilder({
    super.key,
    required this.selectedFilter,
  });
  final String selectedFilter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetAvailableAppointmentsCubit,
      GetAvailableAppointmentsState
    >(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return  AvailableAppointmentsListViewSkel(
              
            );
          },
          success: (appointmentsData) {
            var appointmentList = List<Appointment>.from(appointmentsData);
            var filteredAppointments =
                appointmentList
                    .where((order) => order.type == selectedFilter)
                    .toList();

            return setupSuccess(filteredAppointments);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<Appointment> appointmentList) {
    return AvailableAppointmentsRequestsListView(
      appointmentList: appointmentList,
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
