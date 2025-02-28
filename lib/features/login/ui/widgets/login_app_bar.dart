import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utlils/app_images.dart';

class LoginAppBar extends StatelessWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.loginAppBar, width: double.infinity),
        Padding(
          padding: EdgeInsets.only(top: 180.h),
          child: Center(
            child: Column(
              children: [
                Text('Welcome Back', style: TextStyles.font30WhiteSemiBold),
                SizedBox(height: 3.w),
                Text(
                  ' please complete the following',
                  style: TextStyles.font15WhiteRegular,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
