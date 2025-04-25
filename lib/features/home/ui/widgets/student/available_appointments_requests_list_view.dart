import 'package:flutter/material.dart';
import 'available_appointments_requests_list_view_item.dart';

class AvailableAppointmentsRequestsListView extends StatelessWidget {
  const AvailableAppointmentsRequestsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const AvailableAppointmentsRequestsListViewItem();
      },
    );
  }
}
