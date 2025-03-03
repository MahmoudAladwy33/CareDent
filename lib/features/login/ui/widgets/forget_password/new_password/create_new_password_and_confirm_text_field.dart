import 'package:caredent/features/login/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/helper/app_regex.dart';
import '../../../../../../core/theme/text_styless.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class CreateNewPasswordAndConfirmTextField extends StatefulWidget {
  const CreateNewPasswordAndConfirmTextField({super.key});

  @override
  State<CreateNewPasswordAndConfirmTextField> createState() =>
      _CreateNewPasswordAndConfirmTextFieldState();
}

class _CreateNewPasswordAndConfirmTextFieldState
    extends State<CreateNewPasswordAndConfirmTextField> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: context.read<CreateNewPasswordCubit>().formKey,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.lock_rounded, size: 20),
                SizedBox(width: 8.w),
                Text('Password', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              isObscureText: isPasswordObscureText,
              controller:
                  context.read<CreateNewPasswordCubit>().newPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password required';
                }
                if (value.length < 8) {
                  return 'password must be at least 8 characters';
                }
                if (!AppRegex.isPasswordValid(value)) {
                  return 'Password must include an uppercase letter,\nlowercase letter, number, and special character';
                }
              },
              hintText: 'Enter Your New Password',
              suffixIcon: IconButton(
                icon: Icon(
                  size: 20,
                  isPasswordObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
              ),
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Icon(Icons.check_circle, size: 20),
                SizedBox(width: 8.w),
                Text(
                  'Confirm Password',
                  style: TextStyles.font16DarkBlueMedieum,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              isObscureText: isPasswordConfirmationObscureText,
              controller:
                  context
                      .read<CreateNewPasswordCubit>()
                      .passwordConfirmController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password Confirmation required';
                }
                if (value !=
                    context
                        .read<CreateNewPasswordCubit>()
                        .newPasswordController
                        .text) {
                  return 'Password Confirmation incorrect';
                }
              },
              hintText: 'Enter Your Password Again',
              suffixIcon: IconButton(
                icon: Icon(
                  size: 20,
                  isPasswordConfirmationObscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
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
