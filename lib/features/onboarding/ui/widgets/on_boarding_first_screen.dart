import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/utlils/app_images.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({
    super.key,
    required this.onNext,
    required this.onSkip,
  });
  final VoidCallback onNext;
  final VoidCallback onSkip;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.40, 1],
                colors: [
                  ColorsManager.mainBlue.withOpacity(0.5),
                  Colors.white.withOpacity(0.0),
                ],
              ),
            ),
            child: Image.asset(
              AppImages.onBoardingFirstScreen,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onSkip,
                  child: Text('skip', style: TextStyles.font15WhiteRegular),
                ),
              ),
              SizedBox(height: 21.h),
              Text(
                'Welcome to CareDent!',
                style: TextStyles.font24DarkBlueBold.copyWith(
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Where dental students gain experience and patients receive affordable, quality care under expert supervision.',
                style: TextStyles.font17WhiteRegular,
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: onNext,
                  child: Container(
                    height: 46.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      color: ColorsManager.mainBlue,
                      borderRadius: BorderRadius.circular(24),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text('Next', style: TextStyles.font22WhiteBold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
