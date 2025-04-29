import 'package:caredent/features/home/data/models/get_all_reviews_on_specific_student/get_all_reviews_on_specific_student_response.dart';
import 'package:caredent/features/home/ui/widgets/patients_review_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsReviewListView extends StatelessWidget {
  const PatientsReviewListView({super.key, required this.reviewList});
  final List<Review> reviewList;
  @override
  Widget build(BuildContext context) {
    if (reviewList.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.w),
          child: Text(
            'No reviews available',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: reviewList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        int reverseIndex = reviewList.length - 1 - index;

        return PatientsReviewListViewItem(review: reviewList[reverseIndex]);
      },
    );
  }
}
