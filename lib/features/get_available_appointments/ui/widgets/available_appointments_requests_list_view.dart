import 'package:caredent/features/get_available_appointments/data/models/get_available_appointments_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'available_appointments_requests_list_view_item.dart';

class AvailableAppointmentsRequestsListView extends StatelessWidget {
  const AvailableAppointmentsRequestsListView({
    super.key,
    required this.appointmentList,
  });
  final List<Appointment> appointmentList;

  @override
  Widget build(BuildContext context) {
    return appointmentList.isEmpty
        ? SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Center(
            child: Text(
              'No Available Appointments',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        )
        : ListView.builder(
          itemCount: appointmentList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return AvailableAppointmentsRequestsListViewItem(
              availableAppointment: appointmentList[index],
            );
          },
        );
  }
}
