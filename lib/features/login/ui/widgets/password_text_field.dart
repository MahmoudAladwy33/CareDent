import 'package:caredent/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styless.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.hint});
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
          CustomTextField(
            hintText: hint ?? 'Enter Your Password',
            icon: Icons.visibility_off_rounded,
          ),
        ],
      ),
    );
  }
}
