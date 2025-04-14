import 'dart:developer';

import 'package:caredent/features/profile/ui/widgets/editable_profile_field.dart';
import 'package:caredent/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

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
            ProfileAppBar(userName: user.name),
            EditableProfileField(title: 'User Name', value: user.name),
            SizedBox(height: 12.h),
            EditableProfileField(title: 'Email Address', value: user.email),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Phone Number',
              value: '+20 | ${user.phone}',
            ),
            SizedBox(height: 12.h),
            EditableProfileField(title: 'Chronic Diseases (if any)', value: user.healthRecord),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
