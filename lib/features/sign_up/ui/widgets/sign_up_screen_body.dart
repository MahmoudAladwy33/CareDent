import 'package:caredent/features/login/ui/widgets/email_text_field.dart';
import 'package:caredent/features/login/ui/widgets/password_text_field.dart';
import 'package:caredent/features/sign_up/ui/widgets/confirm_password_text_field.dart';
import 'package:caredent/features/sign_up/ui/widgets/next_button.dart';
import 'package:caredent/features/sign_up/ui/widgets/phone_number_text_field.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up_app_bar.dart';
import 'package:caredent/features/sign_up/ui/widgets/user_name_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SignUpAppBar(),
            SizedBox(height: 18.h),
            UserNameTextField(),
            SizedBox(height: 18.h),
            EmailTextField(),
            SizedBox(height: 18.h),
            PasswordTextField(),
            SizedBox(height: 18.h),
            ConfirmPasswordTextField(),
            SizedBox(height: 18.h),
            PhoneNumberTextField(),
            SizedBox(height: 24.h),
            NextButton(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
