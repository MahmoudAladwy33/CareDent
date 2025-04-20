import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/my_appointments/logic/cubit/get_my_appointments_cubit.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetMyAppointmentsCubit>()..getMyAppointments(),
      child: MyAppointmentsScreenBody(),
    );
  }
}
