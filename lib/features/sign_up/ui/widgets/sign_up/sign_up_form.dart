import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey formKey2 = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey2,
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.person, size: 20),
                SizedBox(width: 8.w),
                Text('User Name', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().fullNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'User Name is required';
                }
                if (value.length < 3) {
                  return 'User Name must be at least 3 characters';
                }
                if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                  return 'User Name must contain only letters';
                }
              },
              hintText: 'Enter Your User Name',
            ),
            SizedBox(height: 18.h),
            Row(
              children: [
                Icon(Icons.email_rounded, size: 20),
                SizedBox(width: 8.w),
                Text('Email', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                } else if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                } else if (!value.startsWith(RegExp(r'^[a-zA-Z]')) ||
                    !value.endsWith('@gmail.com')) {
                  return 'email must start with a character, match\nthe \'@\' symbol, and end with \'gmail.com\'';
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
              isObscureText: isPasswordObscureText,
              controller: context.read<SignUpCubit>().passwordController,
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
              hintText: 'Enter Your Password',
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
              controller: context.read<SignUpCubit>().passwordConfirmController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password Confirmation required';
                }
                if (value !=
                    context.read<SignUpCubit>().passwordController.text) {
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

            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.phone_iphone, size: 20),
                SizedBox(width: 8.w),
                Text('Phone Number', style: TextStyles.font16DarkBlueMedieum),
              ],
            ),
            SizedBox(height: 8.h),
            CustomTextFormField(
              controller: context.read<SignUpCubit>().phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone Number is required';
                } else if (!AppRegex.isPhoneNumberValid(value)) {
                  return 'Please enter a valid phone number';
                }
              },
              hintText: 'Enter Your Number',
            ),
            SizedBox(height: 24.h),
            NextButton(
              onTap: () {
                if ((formKey2.currentState as FormState).validate()) {
                  GoRouter.of(context).push(
                    AppRouter.kCreateAccount,
                    extra: context.read<SignUpCubit>(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
