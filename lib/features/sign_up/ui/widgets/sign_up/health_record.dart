import 'package:caredent/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/text_styless.dart';

class HealthRecord extends StatelessWidget {
  const HealthRecord({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.description, size: 20),
              SizedBox(width: 8.w),
              Text("Health Record", style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
          SizedBox(height: 8.h),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Health Record is required';
              }
              return null;
            },
            controller: controller,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffe5e9ef),
              hintText:
                  "Enter The Health Record And Any Important Information...",
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
