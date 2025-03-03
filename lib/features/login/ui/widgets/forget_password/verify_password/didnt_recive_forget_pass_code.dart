import 'package:caredent/features/login/logic/forget_pass_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_text.dart';

class DidntReciveForgetPassCode extends StatelessWidget {
  const DidntReciveForgetPassCode({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Didn’t receive the code?',
      buttonName: 'Resend',
      onPressed: () {
        context.read<ForgetPasswordCubit>().emitForgetPasswordStates();
      },
    );
  }
}
