import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/get_student_appointments/get_student_appointments_response.dart';
import '../../../logic/get_student_appointments_cubit/get_student_appointments_cubit.dart';
import '../../../logic/get_student_appointments_cubit/get_student_appointments_state.dart';
import 'get_student_appointments_list_view.dart';
import '../my_appointments_list_view_skel.dart';

class GetStudentAppointmentsBlocBuilder extends StatelessWidget {
  const GetStudentAppointmentsBlocBuilder({
    super.key,
    required this.selectedFilter,
  });
  final String selectedFilter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetStudentAppointmentsCubit,
      GetStudentAppointmentsState
    >(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return MyAppointmentsListViewSkel();
          },
          success: (orderssData) {
            log('Success state: $orderssData');
            var appointmentList = List<Order>.from(orderssData);
            var filteredAppointments =
                selectedFilter == 'All'
                    ? appointmentList
                    : appointmentList
                        .where((order) => order.status == selectedFilter)
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

  // Widget setupLoading() {
  //   return const Center(
  //     child: CircularProgressIndicator(color: ColorsManager.mainBlue),
  //   );
  // }

  Widget setupSuccess(List<Order> appointmentList) {
    return GetStudentAppointmentsListView(appointmentList: appointmentList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
