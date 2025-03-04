import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/text_styless.dart';
import '../utlils/app_images.dart';

class CustomBigAppBar extends StatelessWidget {
  const CustomBigAppBar({
    super.key,
    required this.title,
    required this.subTitle,
    this.padding,
    this.textStyle,
  });
  final String title;
  final String subTitle;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.loginAppBarGradient, width: double.infinity),
        Center(
          child: Column(
            children: [
              SizedBox(height: 50.h),
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
              Padding(
                padding: padding ?? EdgeInsets.only(top: 60.h),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: textStyle ?? TextStyles.font30WhiteSemiBold,
                    ),
                    SizedBox(height: 10.w),
                    Text(subTitle, style: TextStyles.font15WhiteRegular),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
