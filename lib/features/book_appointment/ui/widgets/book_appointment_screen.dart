import 'package:caredent/features/book_appointment/ui/widgets/book_appointment_screen_body.dart';
import 'package:flutter/material.dart';

import '../../../home/data/models/service_card_model.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key, required this.serviceCardModel});
final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return BookAppointmentScreenBody(
      serviceCardModel: serviceCardModel,
    );
  }
}
