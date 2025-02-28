import 'package:caredent/features/sign_up/ui/widgets/already_have_an_account.dart';
import 'package:caredent/features/sign_up/ui/widgets/create_account_button.dart';
import 'package:caredent/features/sign_up/ui/widgets/date_of_bairth.dart';
import 'package:caredent/features/sign_up/ui/widgets/gender_selection.dart';
import 'package:caredent/features/sign_up/ui/widgets/health_record.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreenBody extends StatelessWidget {
  const CreateAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SignUpAppBar(),
            SizedBox(height: 18.h),
            GenderSelection(),
            SizedBox(height: 18.h),
            DateOfBirthField(),
            SizedBox(height: 18.h),
            HealthRecord(),
            SizedBox(height: 18.h),
            CreateAccountButton(),
            SizedBox(height: 8.h),
            AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
