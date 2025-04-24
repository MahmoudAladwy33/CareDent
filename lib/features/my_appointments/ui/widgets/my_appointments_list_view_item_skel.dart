import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyAppointmentsListViewItemSkel extends StatelessWidget {
  const MyAppointmentsListViewItemSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
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
            // Profile Image Skeleton
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
            SizedBox(width: 16.w),

            // Text Skeleton
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type Skeleton
                  Container(
                    width: 100.w,
                    height: 16.h,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 8.h),

                  // Line 1
                  Container(
                    width: 140.w,
                    height: 14.h,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 6.h),

                  // Line 2
                  Container(
                    width: 120.w,
                    height: 14.h,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(height: 6.h),

                  // Line 3
                  Container(
                    width: 80.w,
                    height: 14.h,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),

            // Icon Button Skeleton
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
