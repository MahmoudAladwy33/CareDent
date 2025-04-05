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
      appointmentImage: AppImages.bookAppointmentToothExtraction,
      appointmentTitle: 'Tooth Extraction',
      appointmentSubtitle: 'Need To Remove A Damaged Tooth?',
      appointmentBody:
          'Our Expert Dentists Ensure A Painless   And Safe Extraction Process. Book Your Appointment Now!',
      type: "Tooth Extraction",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothVeneers,
      title1: 'Veneers',
      title2: "",
      appointmentImage: AppImages.bookAppointmentToothVeneers,
      appointmentTitle: 'Veneers',
      appointmentSubtitle: 'Transform Your Smile With High-Quality Veneers',
      appointmentBody:
          'Achieve A Natural, Bright, And Flawless Look With Our Professional Dental Care',
    type: "Veneers",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothRoot,
      title1: 'Root Canal',
      title2: 'Treatment',
      appointmentImage: AppImages.bookAppointmentToothRoot,
      appointmentTitle: 'Root Canal Treatment',
      appointmentSubtitle: 'Save Your Natural Tooth',
      appointmentBody:
          'With A Painless Root Canal Treatment.   Our Specialists Provide Effective Care To Relieve Pain And Restore Your Tooth’s Health.',
    type: "Root Canal Treatment",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothFilling,
      title1: 'Dental',
      title2: 'Filling',
      appointmentImage: AppImages.bookAppointmentToothFilling,
      appointmentTitle: 'Dental Filling',
      appointmentSubtitle: 'Got A Cavity?',
      appointmentBody:
          'Our Safe And Durable Dental Fillings Restore Your Tooth’s Strength And Appearance. Book Your Appointment Today!',
   type: "Dental Filling",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothPolishing,
      title1: 'Scaling&',
      title2: 'Polishing',
      appointmentImage: AppImages.bookAppointmentToothPolishing,
      appointmentTitle: 'Scaling & Polishing',
      appointmentSubtitle: 'Maintain A Healthy And Bright Smile',
      appointmentBody:
          'With Professional Teeth Cleaning. Our Scaling & Polishing Treatment Removes Plaque And Stains For A Fresh Loo',
    type: "Scaling & Polishing",
    ),
    ServiceCardModel(
      image: AppImages.serviceCardToothBraces,
      title1: 'Orthodontics',
      title2: '(Braces)',
      appointmentImage: AppImages.bookAppointmentToothBraces,
      appointmentTitle: 'Orthodontics (Braces)',
      appointmentSubtitle: 'Enhance Your Smile',
      appointmentBody:
          'Straighten Your Teeth With Advanced Orthodontic Treatments. Get Started On Your Journey To A Perfect Smile Today!',
    type: "Orthodontics (Braces)",
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
