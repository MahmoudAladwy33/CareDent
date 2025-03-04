import 'package:caredent/features/login/ui/widgets/forget_password/verify_password/didnt_recive_forget_pass_code.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/verify_password/otp_field.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/verify_password/send_verification_code_button.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/verify_password/verify_password_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/custom_big_app_bar.dart';
import '../../../../logic/verify_pass_cubit/verify_password_cubit.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBigAppBar(
              title: 'OTP Verification',
              subTitle:
                  'Enter the verification code we just sent on\n                  your email address',
            ),
            SizedBox(height: 35.h),
            OtpField(controller: context.read<VerifyPasswordCubit>().otpField),
            SizedBox(height: 24.h),
            SendVerificationCodebutton(
              onTap: () => validateThenVerify(context),
            ),
            SizedBox(height: 18.h),
            DidntReciveForgetPassCode(),
            VerifyPassBlocListner(),
          ],
        ),
      ),
    );
  }

  void validateThenVerify(BuildContext context) {
    final form = context.read<VerifyPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<VerifyPasswordCubit>().emitVerifyPasswordStates();
    }
  }
}
