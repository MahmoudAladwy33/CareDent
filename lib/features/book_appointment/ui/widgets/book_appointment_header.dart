import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../home/data/models/service_card_model.dart';

class BookAppointmentHeader extends StatelessWidget {
  const BookAppointmentHeader({super.key,required this.serviceCardModel});
final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 22.h,
              color: ColorsManager.darkBlue,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            serviceCardModel.appointmentTitle,
            style: TextStyles.font18DarkBlueSemiBold.copyWith(
              letterSpacing: 0.9,
            ),
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star, color: Colors.amber, size: 20),
              Icon(Icons.star_half, color: Colors.amber, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
