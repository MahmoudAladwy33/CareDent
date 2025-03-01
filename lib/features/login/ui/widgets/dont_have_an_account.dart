import 'package:caredent/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Don\'t have an account?',
      buttonName: 'Sign Up',
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kSignUpScreen);
      },
    );
  }
}
