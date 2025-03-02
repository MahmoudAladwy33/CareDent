import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    this.isObscureText,
    this.controller,
    this.validator,
    this.suffixIcon,
  });
  final String hintText;
  final IconData? icon;
  final bool? isObscureText;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xffe5e9ef),
        hintText: hintText,
        hintStyle: TextStyles.font14GrayRegular,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsManager.mainBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
      obscureText: isObscureText ?? false,
      validator: (value) {
        return validator!(value);
      },
    );
  }
}
