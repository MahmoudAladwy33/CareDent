import 'package:caredent/features/my_appointments/data/models/get_my_appointments_response.dart';
import 'package:flutter/material.dart';

import 'my_appointments_list_view_item.dart';

class MyAppointmentsListView extends StatelessWidget {
  const MyAppointmentsListView({super.key, required this.appointmentList});
final List<Order> appointmentList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointmentList.length,
      itemBuilder: (context, index) {
        return  MyAppointmentsListViewItem(
          appointment: appointmentList[index],
        );
      },
    );
  }
}
