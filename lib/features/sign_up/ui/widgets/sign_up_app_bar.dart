import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.signUpAppBar, width: double.infinity),
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
                Text('Create Account', style: TextStyles.font30WhiteSemiBold),
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
