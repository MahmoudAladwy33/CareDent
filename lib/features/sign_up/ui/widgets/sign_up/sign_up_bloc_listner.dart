import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/text_styless.dart';
import '../../../logic/sign_up_cubit/sign_up_cubit.dart';
import '../../../logic/sign_up_cubit/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            _showLoadingDialog(context);
          },
          success: (signupResponse) {
            _closeDialog(context);
            GoRouter.of(context).pushReplacement(
              AppRouter.kVerifyAccount,
              extra: context.read<SignUpCubit>(),
            );
          },
          error: (apiErrorModel) {
            _closeDialog(context);
            _showErrorDialog(
              context,
              apiErrorModel.message ?? "An error occurred",
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => Center(
            child: CircularProgressIndicator(color: ColorsManager.mainBlue),
          ),
    );
  }

  void _closeDialog(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: ColorsManager.lightGray,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 28),
                const SizedBox(width: 8),
                Text(
                  "Error",
                  style: TextStyles.font24DarkBlueExtraBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Text(message, style: const TextStyle(fontSize: 16)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 100), () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  });
                },
                child: Text(
                  "Got it",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
