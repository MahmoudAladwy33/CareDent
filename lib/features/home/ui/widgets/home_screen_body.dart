import 'dart:developer';

import 'package:caredent/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:caredent/features/home/ui/widgets/pick_a_service_text.dart';
import 'package:caredent/features/home/ui/widgets/service_grid_view.dart';
import 'package:caredent/features/home/ui/widgets/view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    log('Profile screen got user: ${user?.name}');
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHomeAppBar(userName: user.name),
            SizedBox(height: 18.h),
            ViewAll(),
            SizedBox(height: 32.h),
            PickAServiceText(),
            SizedBox(height: 20.h),
            ServiceGridView(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
