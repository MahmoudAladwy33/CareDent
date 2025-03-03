import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styless.dart';
import '../../../logic/sign_up_cubit/sign_up_cubit.dart';
import '../../../logic/sign_up_cubit/sign_up_state.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final selectedGender =
            context.read<SignUpCubit>().genderController.text;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  const Icon(Icons.wc_rounded, size: 20),
                  SizedBox(width: 8.w),
                  Text("Gender", style: TextStyles.font16DarkBlueMedieum),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGenderButton(context, "Male", Icons.male, selectedGender),
                SizedBox(width: 20.w),
                _buildGenderButton(
                  context,
                  "Female",
                  Icons.female,
                  selectedGender,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildGenderButton(
    BuildContext context,
    String gender,
    IconData icon,
    String selectedGender,
  ) {
    bool isSelected = selectedGender == gender;

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
          context.read<SignUpCubit>().updateGender(gender);
        },
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
            SizedBox(width: 8.w),
            Text(
              gender,
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
