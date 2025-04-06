import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';

class MyAppointmentsFilterItem extends StatelessWidget {
  const MyAppointmentsFilterItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          isSelected == true
              ? Container(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 8.h),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  border: Border.all(color: ColorsManager.darkBlue),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  title,
                  style: TextStyles.font16DarkBlueMedieum.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
              : Container(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 8.h),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  border: Border.all(color: ColorsManager.gray),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Text(
                  title,
                  style: TextStyles.font16DarkBlueMedieum.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.gray,
                  ),
                ),
              ),
    );
  }
}
