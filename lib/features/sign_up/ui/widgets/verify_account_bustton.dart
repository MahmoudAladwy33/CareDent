import 'package:caredent/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyAccountBustton extends StatelessWidget {
  const VerifyAccountBustton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(buttonName: 'Verify Account', onTap: () {}),
    );
  }
}
