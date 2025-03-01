import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/didn%E2%80%99t_receive_the_code.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/otp_field.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account_bustton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Verify Your Account',
            subTitle: 'Please enter the verification code',
            textStyle: TextStyles.font30WhiteSemiBold.copyWith(fontSize: 25.sp),
          ),
          SizedBox(height: 18.h),
          OtpField(),
          SizedBox(height: 24.h),
          VerifyAccountBustton(),
          SizedBox(height: 18.h),
          DidntReceiveTheCode(),
        ],
      ),
    );
  }
}
