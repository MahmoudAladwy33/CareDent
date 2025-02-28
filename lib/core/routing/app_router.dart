import 'package:caredent/features/login/login_screen.dart';
import 'package:caredent/features/onboarding/on_boarding_screen.dart';
import 'package:caredent/features/sign_up/ui/sign_up_screen.dart';
import 'package:caredent/features/sign_up/ui/widgets/create_account_screen_body.dart';
import 'package:caredent/features/splash_view/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kLoginScreen = '/login';
  static const kSignUpScreen = '/signup';
  static const kCreateAccount = '/create-account';

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
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) {
          return const SignUpScreen();
        },
      ),

      GoRoute(
        path: kCreateAccount,
        builder: (context, state) {
          return const CreateAccountScreenBody();
        },
      ),
    ],
  );
}
