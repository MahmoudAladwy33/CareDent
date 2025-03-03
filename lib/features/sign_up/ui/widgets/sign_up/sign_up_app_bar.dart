import 'package:caredent/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Create Account',
      subTitle: 'Please complete the following',
    );
  }
}
