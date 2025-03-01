import 'package:caredent/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/text_styless.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kForgetPassword);
          },
          child: Text(
            'Forget Password?',
            style: TextStyles.font15DarkBlueRegular,
          ),
        ),
      ),
    );
  }
}
