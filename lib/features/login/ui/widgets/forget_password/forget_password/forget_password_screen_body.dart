import 'package:caredent/core/widgets/custom_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password/forget_pass_bloc_listner.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password/forget_password_email.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password/remember_password.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password/send_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../logic/forget_pass_cubit/forget_password_cubit.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Forget Password?',
              subTitle: 'Please enter your email address',
            ),
            SizedBox(height: 18.h),
            ForgetPasswordEmail(),
            SizedBox(height: 24.h),
            SendCodeButton(onTap: () => validateThenSendCode(context)),
            SizedBox(height: 18.h),
            RememberPassword(),
            ForgetPassBlocListner(),
          ],
        ),
      ),
    );
  }

  void validateThenSendCode(BuildContext context) {
    final form = context.read<ForgetPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<ForgetPasswordCubit>().emitForgetPasswordStates();
    }
  }
}
