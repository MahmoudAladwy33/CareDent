import 'package:caredent/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routing/app_router.dart';

class RememberPassword extends StatelessWidget {
  const RememberPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Remember Password?',
      buttonName: 'Login',
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kLoginScreen);
      },
    );
  }
}
