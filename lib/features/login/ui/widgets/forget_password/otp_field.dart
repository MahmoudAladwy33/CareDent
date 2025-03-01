import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/theme/colors_manager.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key});

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
      child: Pinput(
        length: 6,
        showCursor: true,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
      ),
    );
  }
}
