import 'package:caredent/features/home/ui/widgets/get_reports_skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetReviewsStudentSkl extends StatelessWidget {
  const GetReviewsStudentSkl({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w, left: 8.w),
            child: SizedBox(
              width: 330.w,
              child: const GetReportsSkeletonizer(),
            ),
          );
        },
      ),
    );
  }
}
