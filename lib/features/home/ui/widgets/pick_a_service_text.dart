import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';

class PickAServiceText extends StatelessWidget {
  const PickAServiceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'Pick A Service To Request An Appointment',
        style: TextStyles.font16DarkBlueMedieum.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
