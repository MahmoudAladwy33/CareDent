import 'package:caredent/core/widgets/custom_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/create_new_password_text_field.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/text_styless.dart';
import 'confirm_new_password_text_field.dart';

class CreateNewPasswordScreenBody extends StatelessWidget {
  const CreateNewPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Create new password',
            textStyle: TextStyles.font30WhiteSemiBold.copyWith(fontSize: 24.sp),
            subTitle: 'Please enter your new password',
          ),
          SizedBox(height: 18.h),
          CreateNewPasswordTextField(),
          SizedBox(height: 18.h),
          ConfirmNewPasswordTextField(),
          SizedBox(height: 24.h),
          ResetPasswordButton(),
        ],
      ),
    );
  }
}
