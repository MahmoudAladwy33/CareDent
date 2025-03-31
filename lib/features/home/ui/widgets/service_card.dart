import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/features/home/data/models/service_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.serviceCardModel});
  final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 8.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
        color: Color(0xfff4f5f9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 6,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(serviceCardModel.image, height: 50.h),
          serviceCardModel.title2 == ""
              ? SizedBox(height: 18.h)
              : SizedBox(height: 8.h),
          Text(
            serviceCardModel.title1,
            textAlign: TextAlign.center,
            style: TextStyles.font15DarkBlueRegular.copyWith(fontSize: 13),
          ),
          SizedBox(height: 3.h),
          serviceCardModel.title2 == ""
              ? const SizedBox.shrink()
              : Text(
                serviceCardModel.title2,
                textAlign: TextAlign.center,
                style: TextStyles.font15DarkBlueRegular.copyWith(fontSize: 13),
              ),
        ],
      ),
    );
  }
}
