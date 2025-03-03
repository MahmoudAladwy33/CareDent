import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/app_regex.dart';
import '../../../../../../core/theme/text_styless.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../logic/forget_pass_cubit/forget_password_cubit.dart';

class ForgetPasswordEmail extends StatelessWidget {
  const ForgetPasswordEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: context.read<ForgetPasswordCubit>().formKey,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.email_rounded, size: 20),
                SizedBox(width: 8.w),
                Text('Email', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email required';
                }
                if (!AppRegex.isEmailValid(value)) {
                  return 'Invalid email';
                }
                if (!value.startsWith(RegExp(r'^[a-zA-Z]')) ||
                    !value.endsWith('@gmail.com')) {
                  return 'Email must start with a character and end with \'gmail.com\'';
                }
              },
              controller: context.read<ForgetPasswordCubit>().emailController,

              hintText: 'Enter Your Email',
            ),
          ],
        ),
      ),
    );
  }
}
