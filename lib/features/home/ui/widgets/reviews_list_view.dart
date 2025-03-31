import 'package:caredent/features/home/ui/widgets/reviews_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: ListView.builder(
        
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w, left: index == 0 ? 10.w : 0),
            child: SizedBox(width: 330.w, child: ReviewsListViewItem()),
          );
        },
      ),
    );
  }
}
