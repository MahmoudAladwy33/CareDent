import 'package:caredent/features/home/ui/widgets/student/available_appointments_requests_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styless.dart';
import '../../../../../core/utlils/app_images.dart';
import '../../../data/models/service_card_model.dart';

class CustomAvailableAppointmentsAppBar extends StatelessWidget {
  const CustomAvailableAppointmentsAppBar({
    super.key,
    required this.serviceCardModel,
  });
  final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.availableAppointmentsBG,
          width: double.infinity,
          height: 230.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      serviceCardModel.type,
                      style: TextStyles.font17WhiteRegular.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Text(
                'Requests',
                style: TextStyles.font20WhiteSemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              AvailableAppointmentsRequestsListView(),
            ],
          ),
        ),
      ],
    );
  }
}
