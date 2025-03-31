import 'package:caredent/core/utlils/app_images.dart';
import 'package:caredent/features/home/data/models/service_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'service_card.dart';

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({super.key});
  final List<ServiceCardModel> serviceCards = const [
    ServiceCardModel(
      image: AppImages.serviceCardToothExtraction,
      title1: 'Tooth',
      title2: 'Extraction',
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothVeneers,
      title1: 'Veneers',
      title2: "",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothRoot,
      title1: 'Root Canal',
      title2: 'Treatment',
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothFilling,
      title1: 'Dental',
      title2: 'Filling',
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothPolishing,
      title1: 'Scaling&',
      title2: 'Polishing',
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothBraces,
      title1: 'Orthodontics',
      title2: '(Braces)',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 22.h,
          childAspectRatio: 2.5 / 3,
        ),
        itemCount: serviceCards.length,
        itemBuilder: (context, index) {
          return ServiceCard(serviceCardModel: serviceCards[index]);
        },
      ),
    );
  }
}
