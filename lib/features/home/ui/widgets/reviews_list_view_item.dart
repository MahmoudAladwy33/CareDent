import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:caredent/features/home/data/models/get_reports/get_reports_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/get_stars_from_rating.dart';
import 'format_date.dart';
import 'show_review_bottom_sheet.dart';

class ReviewsListViewItem extends StatelessWidget {
  const ReviewsListViewItem({super.key, required this.report});
  final Report report;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.all(5.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              report.user.profileImg == null 
                  ? DefaultUserImg()
                  :
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.network(
                      report.user.profileImg!,
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.cover,
                    ),
                  ),
              SizedBox(width: 10.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    report.user.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...getStarsFromRating(report.ratings.toDouble()),
                      Text(
                        "(${report.ratings.toString()})",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    "Reviewed On ${formatDate(report.createdAt)}",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            report.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => showReviewDialog(context, report),
            child: Text(
              "Read More",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
