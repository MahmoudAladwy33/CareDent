import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utlils/app_images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.textStyle,
  });
  final String title;
  final String subTitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.signUpAppBarGradient, width: double.infinity),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(title, style: textStyle ?? TextStyles.font30WhiteSemiBold),
                SizedBox(height: 3.w),
                Text(subTitle, style: TextStyles.font15WhiteRegular),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
