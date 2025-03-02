import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styless.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ConfirmNewPasswordTextField extends StatelessWidget {
  const ConfirmNewPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, size: 20),
              SizedBox(width: 8.w),
              Text('Confirm Password', style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
          SizedBox(height: 8.h),
          CustomTextFormField(
            hintText: 'Enter Your Password Again',
            icon: Icons.visibility_off_rounded,
          ),
        ],
      ),
    );
  }
}
