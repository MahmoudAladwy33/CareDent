import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.lock_rounded, size: 20),
              SizedBox(width: 16.w),
              Text('Password', style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
          SizedBox(height: 8.h),
          TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.visibility_off_rounded, size: 20),
              filled: true,
              fillColor: Color(0xffe5e9ef),
              hintText: '************',
              hintStyle: TextStyles.font14GrayRegular,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsManager.mainBlue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
