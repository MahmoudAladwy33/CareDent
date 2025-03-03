import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/widgets/custom_button.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomButton(buttonName: 'Send Code', onTap: onTap),
    );
  }
}
