import 'package:caredent/features/home/ui/widgets/student/custom_available_appointments_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../data/models/service_card_model.dart';

class AvailableAppointmentsScreen extends StatelessWidget {
  const AvailableAppointmentsScreen({
    super.key,
    required this.serviceCardModel,
  });
  final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAvailableAppointmentsAppBar(
              serviceCardModel: serviceCardModel,
            ),
          ],
        ),
      ),
    );
  }
}
