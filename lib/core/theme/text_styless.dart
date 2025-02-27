import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font15WhiteRegular = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font24DarkBlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: ColorsManager.darkBlue,
  );

  static TextStyle font17WhiteRegular = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeightHelper.regular,
    color: Colors.white,
  );

  static TextStyle font22WhiteBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.white,
  );
}
