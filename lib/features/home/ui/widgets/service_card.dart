import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/features/home/data/models/service_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/routing/app_router.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.serviceCardModel,
    required this.user,
  });
  final ServiceCardModel serviceCardModel;
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    final hasSecondTitle = serviceCardModel.title2.trim().isNotEmpty;

    return GestureDetector(
      onTap: () {
        user.role == "student"
            ? GoRouter.of(context).push(AppRouter.kAvailableAppointments , extra: serviceCardModel)
            : GoRouter.of(
              context,
            ).push(AppRouter.kBookAppointment, extra: serviceCardModel);
      },
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: const Color(0xfff4f5f9),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              serviceCardModel.image,
              height: 45.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: hasSecondTitle ? 12.h : 16.h),
            Text(
              serviceCardModel.title1,
              textAlign: TextAlign.center,
              style: TextStyles.font15DarkBlueRegular.copyWith(fontSize: 13.sp),
            ),
            if (hasSecondTitle) ...[
              SizedBox(height: 4.h),
              Text(
                serviceCardModel.title2,
                textAlign: TextAlign.center,
                style: TextStyles.font15DarkBlueRegular.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
