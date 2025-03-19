import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/features/onboarding/ui/widgets/on_boarding_first_screen.dart';
import 'package:caredent/features/onboarding/ui/widgets/on_boarding_second_screen.dart';
import 'package:caredent/features/onboarding/ui/widgets/on_boarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/shared_pref_helper.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  final PageController _pageController = PageController();

  void _nextPage()async {
    if (_pageController.page == 2) {
       await SharedPrefHelper.setData('seen_onboarding', true);
      GoRouter.of(context).push(AppRouter.kLoginScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _lastPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skip()async {
     await SharedPrefHelper.setData('seen_onboarding', true);
    GoRouter.of(context).push(AppRouter.kLoginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnBoardingFirstScreen(onNext: _nextPage, onSkip: _skip),
          OnBoardingSecondScreen(
            onNext: _nextPage,
            onSkip: _skip,
            onPrevious: _lastPage,
          ),
          OnBoardingThirdScreen(
            onNext: _nextPage,
            onSkip: _skip,
            onPrevious: _lastPage,
          ),
        ],
      ),
    );
  }
}
