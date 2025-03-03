import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/widgets/custom_text_form_field.dart';
import 'package:caredent/features/login/logic/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/app_regex.dart';

class EmailAndPasswordForm extends StatefulWidget {
  const EmailAndPasswordForm({super.key});

  @override
  State<EmailAndPasswordForm> createState() => _EmailAndPasswordFormState();
}

class _EmailAndPasswordFormState extends State<EmailAndPasswordForm> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: context.read<LoginCubit>().formKey,
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
              controller: context.read<LoginCubit>().emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              hintText: 'Enter Your Email',
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Icon(Icons.lock_rounded, size: 20),
                SizedBox(width: 8.w),
                Text('Password', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              isObscureText: isObscure,
              controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                } else if (!AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
              },
              hintText: 'Enter Your Password',
              suffixIcon: IconButton(
                icon: Icon(
                  size: 20,
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),

                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
