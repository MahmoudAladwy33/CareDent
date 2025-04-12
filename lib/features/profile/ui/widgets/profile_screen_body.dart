import 'package:caredent/features/profile/ui/widgets/editable_profile_field.dart';
import 'package:caredent/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAppBar(),
            EditableProfileField(title: 'User Name', value: 'Mahmoud Aladwy'),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Email Address',
              value: 'mahmoudaladwy774@gmail.com',
            ),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Phone Number',
              value: '+20 | 010 1234 5678',
            ),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Chronic Diseases (if any)',
              value: 'Diabetes , heart disease',
            ),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
