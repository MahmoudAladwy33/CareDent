import 'package:caredent/core/networking/api_error_model.dart';
import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/features/login/logic/cubit/login_cubit.dart';
import 'package:caredent/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
            );
          },
          success: (loginResponse) {
            if (Navigator.canPop(context)) {
              Navigator.of(context, rootNavigator: true).pop();
            }
            // final userName = loginResponse.userData?.firstName ?? 'User';
            // SharedPreferences.getInstance().then((prefs) {
            //   prefs.setString('userName', userName);
            // });
            //  GoRouter.of(context).go(AppRouter.kHomeScreen, extra: userName);
          },
          error: (apiErrorModel) {
            if (Navigator.canPop(context)) {
              Navigator.of(
                context,
                rootNavigator: true,
              ).pop(); // Close loading dialog
            }
            setupErrorState(
              context,
              apiErrorModel,
            ); // Show error using AwesomeDialog
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 28),
                const SizedBox(width: 8),
                Text(
                  "Error",
                  style: TextStyles.font24DarkBlueExtraBold.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(apiErrorModel.message!, style: TextStyle(fontSize: 16)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
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
