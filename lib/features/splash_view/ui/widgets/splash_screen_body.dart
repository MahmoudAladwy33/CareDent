import 'dart:math';
import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      _controller.stop();
      GoRouter.of(context).push(AppRouter.kOnBoardingScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.splashViewBackground),
          Positioned(
            top: 305.h,
            left: 95.w,
            child: Image.asset(AppImages.appLogo, width: 189.w, height: 74.h),
          ),
          Positioned(
            top: 390.h,
            left: 160.w,
            child: AnimatedBuilder(
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
          ),
        ],
      ),
    );
  }
}
