import 'package:caredent/core/di/service_locator.dart';
import 'package:caredent/features/book_appointment/ui/widgets/book_appointment_screen.dart';
import 'package:caredent/features/home/ui/home_screen.dart';
import 'package:caredent/features/login/logic/create_new_password_cubit/create_new_password_cubit.dart';
import 'package:caredent/features/login/logic/forget_pass_cubit/forget_password_cubit.dart';
import 'package:caredent/features/login/logic/login_cubit/login_cubit.dart';
import 'package:caredent/features/login/logic/verify_pass_cubit/verify_password_cubit.dart';
import 'package:caredent/features/login/login_screen.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/new_password/create_new_password_screen_body.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password/forget_password_screen_body.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/verify_password/otp_screen.dart';
import 'package:caredent/features/onboarding/on_boarding_screen.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:caredent/features/sign_up/logic/verify_account_cubit/verify_account_cubit.dart';
import 'package:caredent/features/sign_up/ui/sign_up_screen.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/create_account_screen_body.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account/verify_account_screen_body.dart';
import 'package:caredent/features/splash_view/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/service_card_model.dart';

abstract class AppRouter {
  static const kOnBoardingScreen = '/onboarding';
  static const kLoginScreen = '/login';
  static const kSignUpScreen = '/signup';
  static const kCreateAccount = '/create-account';
  static const kForgetPassword = '/forget-password';
  static const kOtpScreen = '/otpScreen';
  static const kCreateNewPassword = '/create-new-password';
  static const kVerifyAccount = '/verify-account';
  static const kHomeScreen = '/home';
  static const kBookAppointment = '/book-appointment';

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
          return BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          );
        },
      ),

      GoRoute(
        path: kCreateAccount,
        builder: (context, state) {
          final signUpCubit = state.extra as SignUpCubit;
          return BlocProvider.value(
            value: signUpCubit,
            child: const CreateAccountScreenBody(),
          );
        },
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreenBody(),
          );
        },
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) {
          final forgetPasswordCubit = state.extra as ForgetPasswordCubit;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<VerifyPasswordCubit>()),
              BlocProvider.value(value: forgetPasswordCubit),
            ],
            child: const OtpScreen(),
          );
        },
      ),
      GoRoute(
        path: kCreateNewPassword,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<CreateNewPasswordCubit>(),
            child: const CreateNewPasswordScreenBody(),
          );
        },
      ),
      GoRoute(
        path: kVerifyAccount,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<VerifyAccountCubit>()),
              BlocProvider.value(value: state.extra as SignUpCubit),
            ],

            child: const VerifyAccountScreenBody(),
          );
        },
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: kBookAppointment,
        builder: (context, state) {
          final serviceCardModel = state.extra as ServiceCardModel;
          return BookAppointmentScreen(serviceCardModel: serviceCardModel);
        },
      ),
    ],
  );
}
