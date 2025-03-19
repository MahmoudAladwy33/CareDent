import 'dart:math';
import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'double_half_circle_painter.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Future.delayed(const Duration(seconds: 3), () {
    //   _controller.stop();
    //    GoRouter.of(context).push(AppRouter.kOnBoardingScreen);
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    _controller.stop();

    bool hasSeenOnboarding = await SharedPrefHelper.getBool('seen_onboarding');
    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isNotEmpty && token != '') {
      context.go(AppRouter.kHomeScreen);
    } else if (hasSeenOnboarding) {
      context.go(AppRouter.kLoginScreen);
    } else {
      context.go(AppRouter.kOnBoardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashViewBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.appLogo, width: 189.w, height: 74.h),
                SizedBox(height: 18.h),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: CustomPaint(
                    size: Size(70.w, 70.h),
                    painter: DoubleHalfCirclePainter(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
