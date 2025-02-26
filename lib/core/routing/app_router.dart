import 'package:caredent/features/onboarding/on_boarding_screen.dart';
import 'package:caredent/features/splash_view/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) {
          return const OnBoardingScreen();
        },
      ),
    ],
  );
}
