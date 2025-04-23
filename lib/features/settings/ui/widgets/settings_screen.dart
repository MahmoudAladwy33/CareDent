import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/settings/logic/create_report_cubit/create_report_cubit.dart';
import 'package:caredent/features/settings/logic/update_report_cubit/update_report_cubit.dart';
import 'package:caredent/features/settings/ui/widgets/settings_screen_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CreateReportCubit>()),
        BlocProvider(create: (context) => getIt<UpdateReportCubit>()),
      ],
      child: const SettingsScreenBody(),
    );
  }
}
