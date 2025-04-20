import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/features/my_appointments/data/models/get_appoinments/get_my_appointments_response.dart';
import 'package:caredent/features/my_appointments/logic/get_appoinments_cubit/get_my_appointments_cubit.dart';
import 'package:caredent/features/my_appointments/logic/get_appoinments_cubit/get_my_appointments_state.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentsBlocBuilder extends StatelessWidget {
  const MyAppointmentsBlocBuilder({super.key, required this.selectedFilter});
  final String selectedFilter;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyAppointmentsCubit, GetMyAppointmentsState>(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return setupLoading();
          },
          success: (orderssData) {
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

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(color: ColorsManager.mainBlue),
    );
  }

  Widget setupSuccess(List<Order> appointmentList) {
    return MyAppointmentsListView(appointmentList: appointmentList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
