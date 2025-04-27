import 'package:caredent/features/get_available_appointments/ui/widgets/accept_appointment_bloc_listener.dart';
import 'package:caredent/features/get_available_appointments/ui/widgets/custom_available_appointments_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../home/data/models/service_card_model.dart';

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
            AcceptAppointmentBlocListener(),
          ],
        ),
      ),
    );
  }
}
