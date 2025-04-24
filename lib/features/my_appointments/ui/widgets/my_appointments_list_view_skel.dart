import 'package:flutter/material.dart';
import 'my_appointments_list_view_item_skel.dart';

class MyAppointmentsListViewSkel extends StatelessWidget {
  const MyAppointmentsListViewSkel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return MyAppointmentsListViewItemSkel();
      },
    );
  }
}
