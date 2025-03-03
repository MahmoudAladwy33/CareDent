import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../../../../core/theme/colors_manager.dart';
import '../../../../logic/verify_pass_cubit/verify_password_cubit.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 55.h,
      textStyle: TextStyles.font16DarkBlueMedieum.copyWith(
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffe5e9ef),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Color(0xffe5e9ef),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorsManager.mainBlue, width: 2),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: context.read<VerifyPasswordCubit>().formKey,
        child: Pinput(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Verification code is required';
            }
            return null;
          },
          controller: controller,
          length: 6,
          showCursor: true,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
        ),
      ),
    );
  }
}
