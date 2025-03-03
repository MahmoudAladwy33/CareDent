import 'package:caredent/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key, this.onTap});
  final void Function()? onTap;
  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(
        buttonName: 'Create Account',
        onTap: onTap,
      ),
    );
  }
}
