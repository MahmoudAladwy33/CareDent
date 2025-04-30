import 'package:caredent/features/home/data/models/get_reports/get_reports_model.dart';
import 'package:caredent/features/home/ui/widgets/reviews_empty_list.dart';
import 'package:caredent/features/home/ui/widgets/reviews_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key, required this.reportList});
  final List<Report> reportList;
  @override
  Widget build(BuildContext context) {
    if (reportList.isEmpty) {
      return ReviewsEmptyList();
    }
    return Padding(
      padding: EdgeInsets.only(top: 238.h),
      child: SizedBox(
        height: 175.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: reportList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 8.w, left: index == 0 ? 10.w : 0),
              child: SizedBox(
                width: 330.w,
                child: ReviewsListViewItem(report: reportList[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
