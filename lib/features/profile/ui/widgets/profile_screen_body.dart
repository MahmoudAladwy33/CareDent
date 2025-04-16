import 'package:caredent/features/profile/ui/widgets/editable_profile_field.dart';
import 'package:caredent/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/app_regex.dart';
import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../core/models/user_model.dart';
import '../../logic/cubit/update_user_cubit.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserCubit>().state.user;
    if (user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final cubit = context.read<UpdateUserCubit>();
    cubit.fullNameController.text = user.name;
    cubit.phoneController.text = user.phone;
    cubit.healthRecordController.text = user.healthRecord;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: context.read<UpdateUserCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileAppBar(userName: user.name),
              EditableProfileField(
                onCheckPressed: () {
                  validateThenUpdate(context, user);
                },
                controller: cubit.fullNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'User Name is required';
                  }
                  if (value.length < 3) {
                    return 'User Name must be at least 3 characters';
                  }
                  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                    return 'User Name must contain only letters';
                  }
                  return null;
                },
                title: 'User Name',
                //value: user.name,
              ),
              SizedBox(height: 12.h),
              EditableProfileField(
                title: 'Email Address',
                value: user.email,
                check: true,
              ),
              SizedBox(height: 12.h),
              EditableProfileField(
                onCheckPressed: () {
                  validateThenUpdate(context, user);
                },
                controller: cubit.phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  } else if (!AppRegex.isPhoneNumberValid(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                title: 'Phone Number',
                // value: user.phone,
              ),
              SizedBox(height: 12.h),
              EditableProfileField(
                onCheckPressed: () {
                  validateThenUpdate(context, user);
                },
                controller: cubit.healthRecordController,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Chronic Diseases is required';
                  }
                  return null;
                },
                title: 'Chronic Diseases (if any)',
                // value: user.healthRecord,
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenUpdate(BuildContext context, UserModel user) async {
    final cubit = context.read<UpdateUserCubit>();
    if (cubit.formKey.currentState!.validate()) {
      context.read<UpdateUserCubit>().emitUpdateUserStates(
        oldName: user.name,
        oldPhone: user.phone,
        oldHealthRecord: user.healthRecord,
      );

      final updatedUser = user.copyWith(
        name:
            cubit.fullNameController.text.isNotEmpty
                ? cubit.fullNameController.text
                : user.name,
        phone:
            cubit.phoneController.text.isNotEmpty
                ? cubit.phoneController.text
                : user.phone,
        healthRecord:
            cubit.healthRecordController.text.isNotEmpty
                ? cubit.healthRecordController.text
                : user.healthRecord,
      );

      context.read<UserCubit>().setUser(updatedUser);
      saveUserDataLocally(updatedUser);
    }
  }
}
