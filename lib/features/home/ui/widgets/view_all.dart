import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'View All',
            style: TextStyles.font16DarkBlueMedieum.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 5.w),
          const Icon(Icons.arrow_circle_right_outlined, size: 22),
        ],
      ),
    );
  }
}
