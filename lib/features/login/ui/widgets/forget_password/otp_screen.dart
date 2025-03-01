import 'package:caredent/core/widgets/custom_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/didn%E2%80%99t_receive_the_code.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/otp_field.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/send_verification_code_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'OTP Verification',
            subTitle: 'Enter the verification code',
          ),
          SizedBox(height: 28.h),
          OtpField(),
          SizedBox(height: 24.h),
          SendVerificationCodebutton(),
          SizedBox(height: 18.h),
          DidntReceiveTheCode(),
        ],
      ),
    );
  }
}
