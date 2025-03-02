import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
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
          CustomTextFormField(hintText: 'Enter Your User Name'),
        ],
      ),
    );
  }
}
