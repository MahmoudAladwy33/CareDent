import 'package:caredent/features/login/logic/cubit/login_cubit.dart';
import 'package:caredent/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:caredent/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:caredent/features/login/ui/widgets/email_and_password_form.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/forget_password.dart';
import 'package:caredent/features/login/ui/widgets/login_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoginAppBar(),
            SizedBox(height: 18.h),
            EmailAndPasswordForm(),

            SizedBox(height: 18.h),
            ForgetPassword(),
            SizedBox(height: 18.h),
            LoginButton(
              onTap: () {
                validateThenDoLogin(context);
              },
            ),
            SizedBox(height: 8.h),
            DontHaveAnAccount(),
            LoginBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    final form = context.read<LoginCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
