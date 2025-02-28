import 'package:caredent/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(
        buttonName: 'Next',
        onTap: () {
          GoRouter.of(context).push(AppRouter.kCreateAccount);
        },
      ),
    );
  }
}
