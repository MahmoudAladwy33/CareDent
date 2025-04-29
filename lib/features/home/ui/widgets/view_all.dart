import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kViewAll);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'What our patients say',
              style: TextStyles.font16DarkBlueMedieum.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5.w),
            const Icon(Icons.arrow_circle_right_outlined, size: 22),
          ],
        ),
      ),
    );
  }
}
