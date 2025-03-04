import 'package:caredent/features/sign_up/ui/widgets/verify_account/didn%E2%80%99t_receive_the_code.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account/verify_account_bloc_listener.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account/verify_account_bustton.dart';
import 'package:caredent/features/sign_up/ui/widgets/verify_account/verify_account_opt_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_big_app_bar.dart';
import '../../../logic/verify_account_cubit/verify_account_cubit.dart';

class VerifyAccountScreenBody extends StatelessWidget {
  const VerifyAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBigAppBar(
              title: 'Verify Your Account',
              subTitle:
                  'Enter the 6-digit code we just sent on\n               your email address',
            ),
            SizedBox(height: 18.h),
            VerifyAccountOptCode(
              controller: context.read<VerifyAccountCubit>().otpField,
            ),
            SizedBox(height: 24.h),
            VerifyAccountBustton(onTap: () => validateThenVerify(context)),
            SizedBox(height: 18.h),
            DidntReceiveTheCode(),
            VerifyAccountBlocListner(),
          ],
        ),
      ),
    );
  }

  void validateThenVerify(BuildContext context) {
    if (context.read<VerifyAccountCubit>().formKey.currentState!.validate()) {
      context.read<VerifyAccountCubit>().emitVerifyAccountStates();
    }
  }
}
