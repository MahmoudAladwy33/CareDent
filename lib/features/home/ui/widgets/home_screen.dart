import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/home/logic/cubit/get_reports_cubit.dart';
import 'package:caredent/features/home/ui/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetReportsCubit>()..getReports(),
      child: HomeScreenBody(),
    );
  }
}
