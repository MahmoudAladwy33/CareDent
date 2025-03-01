import 'package:caredent/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DidntReceiveTheCode extends StatelessWidget {
  const DidntReceiveTheCode({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Didn’t receive the code?',
      buttonName: 'Resend',
      onPressed: () {},
    );
  }
}
