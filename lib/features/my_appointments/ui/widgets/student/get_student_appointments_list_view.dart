import 'package:flutter/material.dart';
import '../../../data/models/get_student_appointments/get_student_appointments_response.dart';
import 'get_student_appointments_list_view_item.dart';

class GetStudentAppointmentsListView extends StatelessWidget {
  const GetStudentAppointmentsListView({super.key, required this.appointmentList});
  final List<Order> appointmentList;

  @override
  Widget build(BuildContext context) {
    if (appointmentList.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text(
            'No appointments available.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointmentList.length,
      itemBuilder: (context, index) {
        int reverseIndex = appointmentList.length - 1 - index;

        return GetStudentAppointmentsListViewItem(
          appointment: appointmentList[reverseIndex],
        );
      },
    );
  }
}
