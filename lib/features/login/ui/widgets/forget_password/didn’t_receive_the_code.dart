import 'package:caredent/core/widgets/custom_text.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DidntReceiveTheCode extends StatelessWidget {
  const DidntReceiveTheCode({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      title: 'Didn’t receive the code?',
      buttonName: 'Resend',
      onPressed: () {
        context.read<SignUpCubit>().emitSignupStates();
      },
    );
  }
}
