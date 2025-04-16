import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/profile/ui/widgets/profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/update_user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateUserCubit>(),
      child: ProfileScreenBody(),
    );
  }
}
