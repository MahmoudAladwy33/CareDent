import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theme/text_styless.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 36.w, left: 8.w, right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already Have an Account?',
            style: TextStyles.font15DarkBlueRegular,
          ),
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginScreen);
            },
            child: Text('Login', style: TextStyles.font15MainBlueBold),
          ),
        ],
      ),
    );
  }
}
