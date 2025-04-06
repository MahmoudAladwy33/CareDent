import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsListViewItem extends StatelessWidget {
  const MyAppointmentsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Image.asset(
              AppImages.homeProfilePic,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Root Canal Treatment',
                  style: TextStyles.font16DarkBlueMedieum.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dr Mohamed Khaled',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 2.h),
                Text(
                  'November 10, 2025',
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: () {
              // Function to delete or confirm deletion
            },
            icon: Icon(Icons.delete_outline),
            color: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }
}
