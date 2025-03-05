import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styless.dart';
import '../../../logic/sign_up_cubit/sign_up_cubit.dart';
import '../../../logic/sign_up_cubit/sign_up_state.dart';

class RoleSelection extends StatefulWidget {
  const RoleSelection({super.key});

  @override
  State<RoleSelection> createState() => _RoleSelectionState();
}

class _RoleSelectionState extends State<RoleSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final selectedRole = context.read<SignUpCubit>().roleController.text;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  const Icon(Icons.manage_accounts, size: 20),
                  SizedBox(width: 8.w),
                  Text(
                    "Select your Role",
                    style: TextStyles.font16DarkBlueMedieum,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRoleButton(
                  context,
                  "Student",
                  Icons.school,
                  selectedRole,
                ),
                SizedBox(width: 20.w),
                _buildRoleButton(
                  context,
                  "Patient",
                  Icons.local_hospital,
                  selectedRole,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildRoleButton(
    BuildContext context,
    String role,
    IconData icon,
    String selectedRole,
  ) {
    bool isSelected =
        (role == "Patient" && selectedRole == "user") || (selectedRole == role);

    return SizedBox(
      width: 130.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side:
              isSelected
                  ? const BorderSide(color: Colors.blue, width: 1.5)
                  : BorderSide.none,
          backgroundColor:
              isSelected
                  ? Colors.blue.withOpacity(0.1)
                  : const Color(0xffe5e9ef),
        ),
        onPressed: () {
          context.read<SignUpCubit>().updateRole(
            role == "Patient" ? "user" : role,
          );
          setState(() {});
        },
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            SizedBox(width: 8.w),
            Text(
              role,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
