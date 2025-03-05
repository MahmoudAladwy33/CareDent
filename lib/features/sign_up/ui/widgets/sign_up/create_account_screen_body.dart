import 'package:caredent/features/sign_up/ui/widgets/sign_up/already_have_an_account.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/create_account_button.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/date_of_bairth.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/gender_selection.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/health_record.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/role_selection.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/sign_up_app_bar.dart';
import 'package:caredent/features/sign_up/ui/widgets/sign_up/sign_up_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/sign_up_cubit/sign_up_cubit.dart';

class CreateAccountScreenBody extends StatelessWidget {
  const CreateAccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: context.read<SignUpCubit>().formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignUpAppBar(),
              SizedBox(height: 18.h),
              RoleSelection(),
              SizedBox(height: 18.h),
              GenderSelection(),
              SizedBox(height: 18.h),
              DateOfBirthField(
                controller: context.read<SignUpCubit>().dateOfBirthController,
              ),
              SizedBox(height: 18.h),
              HealthRecord(
                controller: context.read<SignUpCubit>().healthRecordController,
              ),
              SizedBox(height: 18.h),
              CreateAccountButton(
                onTap: () {
                  validateThenDoSignup(context);
                },
              ),
              SizedBox(height: 8.h),
              AlreadyHaveAnAccount(),
              SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignupStates();
    }
  }
}
