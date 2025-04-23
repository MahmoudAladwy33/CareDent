import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'get_reports_skeletonizer.dart';

class GetReportsSkeleList extends StatelessWidget {
  const GetReportsSkeleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 238.h),
      child: SizedBox(
        height: 175.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w, left: index == 0 ? 10.w : 0),
              child: SizedBox(
                width: 330.w,
                child: const GetReportsSkeletonizer(),
              ),
            );
          },
        ),
      ),
    );
  }
}