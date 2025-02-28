import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({
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
              AppImages.onBoardingThirdScreen,
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
                'Ready to Transform\nYour Smile?',
                style: TextStyles.font24DarkBlueExtraBold,
              ),
              SizedBox(height: 12.h),
              Text(
                'Sign up now and take the first step towards affordable, quality dental care.',
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
                        'Get Started',
                        style: TextStyles.font22WhiteSemiBold,
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
