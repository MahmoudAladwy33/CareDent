import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors_manager.dart';
import '../../../../../core/theme/text_styless.dart';

class SkillsAndExperience extends StatelessWidget {
  const SkillsAndExperience({
    super.key,
    this.academicController,
    this.skillsController,
  });
  final TextEditingController? academicController;
  final TextEditingController? skillsController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.school, size: 20),
              SizedBox(width: 8.w),
              Text("Academic year", style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
          SizedBox(height: 8.h),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'academic year is required';
              }
              return null;
            },
            controller: academicController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffe5e9ef),
              hintText: "Type your academic year",
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
          SizedBox(height: 18.h),
          Row(
            children: [
              Icon(Icons.psychology, size: 20),
              SizedBox(width: 8.w),
              Text(
                "Skills & experience",
                style: TextStyles.font16DarkBlueMedieum,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'skills & experience is required';
              }
              return null;
            },
            controller: skillsController,
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffe5e9ef),
              hintText:
                  "Type your skills & experience and any important information...",
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
