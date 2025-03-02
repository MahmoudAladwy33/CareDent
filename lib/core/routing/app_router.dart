import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/login/logic/cubit/login_cubit.dart';
import 'package:caredent/features/login/login_screen.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/create_new_password_screen_body.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password_screen_body.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/otp_screen.dart';
import 'package:caredent/features/onboarding/on_boarding_screen.dart';
import 'package:caredent/features/sign_up/ui/sign_up_screen.dart';
import 'package:caredent/features/sign_up/ui/widgets/create_account_screen_body.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account_screen_body.dart';
import 'package:caredent/features/splash_view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kLoginScreen = '/login';
  static const kSignUpScreen = '/signup';
  static const kCreateAccount = '/create-account';
  static const kForgetPassword = '/forget-password';
  static const kOtpScreen = '/otpScreen';
  static const kCreateNewPassword = '/create-new-password';
  static const kVerifyAccount = '/verify-account';

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
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
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
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) {
          return const ForgetPasswordScreenBody();
        },
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) {
          return const OtpScreen();
        },
      ),
      GoRoute(
        path: kCreateNewPassword,
        builder: (context, state) {
          return const CreateNewPasswordScreenBody();
        },
      ),
      GoRoute(
        path: kVerifyAccount,
        builder: (context, state) {
          return const VerifyAccountScreenBody();
        },
      ),
    ],
  );
}
