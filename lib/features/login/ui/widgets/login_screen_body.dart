import 'package:caredent/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:caredent/features/login/ui/widgets/login_email_text_field.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password.dart';
import 'package:caredent/features/login/ui/widgets/login_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/login_button.dart';
import 'package:caredent/features/login/ui/widgets/login_password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoginAppBar(),
            SizedBox(height: 18.h),
            LoginEmailTextField(),
            SizedBox(height: 18.h),
            LoginPasswordTextField(),
            SizedBox(height: 18.h),
            ForgetPassword(),
            SizedBox(height: 18.h),
            LoginButton(),
            SizedBox(height: 8.h),
            DontHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
