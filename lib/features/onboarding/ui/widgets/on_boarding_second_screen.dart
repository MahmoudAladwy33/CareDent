import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.onPrevious,
  });
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onPrevious;
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
              AppImages.onBoardingSecondScreen,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onPrevious,
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),

                  GestureDetector(
                    onTap: onSkip,
                    child: Text('skip', style: TextStyles.font15WhiteRegular),
                  ),
                ],
              ),
              SizedBox(height: 21.h),
              Text(
                'Personalized Care,\nJust for You',
                style: TextStyles.font24DarkBlueExtraBold,
              ),
              SizedBox(height: 12.h),
              Text(
                'Our students and experts work together to provide tailored dental solutions that meet your needs.',
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
                      child: Text(
                        'Next',
                        style: TextStyles.font20WhiteSemiBold,
                      ),
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
