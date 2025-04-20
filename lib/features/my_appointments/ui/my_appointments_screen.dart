import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/my_appointments/logic/create_review_cubit/create_review_cubit.dart';
import 'package:caredent/features/my_appointments/logic/get_appoinments_cubit/get_my_appointments_cubit.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/delete_appoinment_cubit/delete_appoinment_cubit.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => getIt<GetMyAppointmentsCubit>()..getMyAppointments(),
        ),
        BlocProvider(create: (context) => getIt<CreateReviewCubit>()),
        BlocProvider(create: (context) => getIt<DeleteAppoinmentCubit>()),
      ],
      child: MyAppointmentsScreenBody(),
    );
  }
}
