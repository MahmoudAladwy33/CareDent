import 'package:caredent/features/get_available_appointments/ui/widgets/available_appointments_list_view_item_skel.dart';
import 'package:flutter/material.dart';

class AvailableAppointmentsListViewSkel extends StatelessWidget {
  const AvailableAppointmentsListViewSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AvailableAppointmentsListViewItemSkel();
      },
    );
  }
}
