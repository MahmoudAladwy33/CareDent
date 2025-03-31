import 'package:caredent/core/utlils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: CurvedNavigationBar(
        index: currentIndex,
        animationDuration: const Duration(milliseconds: 400),
        backgroundColor: Colors.transparent,
        color: const Color(0xff045fc9),
        onTap: onTap,
        items: [
          SvgPicture.asset(AppImages.navigationBarHome, width: 28, height: 28),
          Image.asset(AppImages.navigationBarCheckList, width: 28, height: 28),
          SvgPicture.asset(
            AppImages.navigationBarProfile,
            width: 28,
            height: 28,
          ),
          SvgPicture.asset(
            AppImages.navigationBarSettings,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
