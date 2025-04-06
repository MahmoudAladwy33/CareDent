import 'package:flutter/material.dart';

import 'my_appointments_list_view_item.dart';

class MyAppointmentsListView extends StatelessWidget {
  const MyAppointmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MyAppointmentsListViewItem();
      },
    );
  }
}
