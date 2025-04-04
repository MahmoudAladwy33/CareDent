import 'package:caredent/features/home/data/models/service_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';

class BookAppointmentBody extends StatelessWidget {
  const BookAppointmentBody({super.key, required this.serviceCardModel});
  final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            serviceCardModel.appointmentSubtitle,
            style: TextStyles.font18DarkBlueSemiBold,
          ),
          SizedBox(height: 8.h),
          Text(
            serviceCardModel.appointmentBody,
            style: TextStyles.font18DarkBlueSemiBold.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
