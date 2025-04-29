import 'package:caredent/features/home/data/models/get_all_reviews_on_specific_student/get_all_reviews_on_specific_student_response.dart';
import 'package:caredent/features/home/ui/widgets/format_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/get_stars_from_rating.dart';
import '../../../../core/widgets/default_user_img.dart';

class PatientsReviewListViewItem extends StatelessWidget {
  const PatientsReviewListViewItem({super.key, required this.review});
  final Review review;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              review.user!.profileImg == null
                  ? DefaultUserImg()
                  : ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.network(
                      review.user!.profileImg!,
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
                    review.user!.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...getStarsFromRating(review.ratings.toDouble()),
                      Text(
                        "(${review.ratings.toString()})",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    "Reviewed On ${formatDate(review.createdAt)}",

                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            review.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
