import 'package:caredent/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/app_router.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Already Have an Account?',
      buttonName: 'Login',
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kLoginScreen);
      },
    );
  }
}
