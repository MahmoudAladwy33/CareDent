import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  GenderSelectionState createState() => GenderSelectionState();
}

class GenderSelectionState extends State<GenderSelection> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Icon(Icons.wc_rounded, size: 20),
              SizedBox(width: 8.w),
              Text("Gender", style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGenderButton("Male", Icons.male),
            SizedBox(width: 20.w),
            _buildGenderButton("Female", Icons.female),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender, IconData icon) {
    bool isSelected = selectedGender == gender;

    return SizedBox(
      width: 145.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side:
              isSelected
                  ? BorderSide(color: Colors.blue, width: 1.5)
                  : BorderSide.none,
          backgroundColor:
              isSelected ? Colors.blue.withOpacity(0.1) : Color(0xffe5e9ef),
        ),
        onPressed: () {
          setState(() {
            selectedGender = gender;
          });
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
