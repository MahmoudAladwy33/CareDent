import 'package:caredent/features/sign_up/ui/widgets/sign_up/sign_up_app_bar.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/sign_up_bloc_listner.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/sign_up_form.dart';
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
            SignUpForm(),
            SizedBox(height: 24.h),
            SignupBlocListener(),
          ],
        ),
      ),
    );
  }
}
