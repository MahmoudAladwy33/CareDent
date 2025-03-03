import 'package:caredent/core/widgets/custom_app_bar.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/new_password/create_new_password_and_confirm_text_field.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/new_password/create_new_password_bloc_listner.dart';
import 'package:caredent/features/login/ui/widgets/forget_password/new_password/reset_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/text_styless.dart';
import '../../../../logic/create_new_password_cubit/create_new_password_cubit.dart';

class CreateNewPasswordScreenBody extends StatelessWidget {
  const CreateNewPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Create new password',
              textStyle: TextStyles.font30WhiteSemiBold.copyWith(
                fontSize: 24.sp,
              ),
              subTitle: 'Please enter your new password',
            ),
            SizedBox(height: 18.h),
            CreateNewPasswordAndConfirmTextField(),
            SizedBox(height: 24.h),
            ResetPasswordButton(onTap: () => validateThenSendCode(context)),
            CreateNewPasswordBlocListener(),
          ],
        ),
      ),
    );
  }

  void validateThenSendCode(BuildContext context) {
    final form = context.read<CreateNewPasswordCubit>().formKey.currentState;
    if (form!.validate()) {
      context.read<CreateNewPasswordCubit>().emitCreateNewPasswordStates();
    }
  }
}
