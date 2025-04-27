import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:caredent/features/my_appointments/data/models/get_appoinments/get_my_appointments_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../logic/delete_appoinment_cubit/delete_appoinment_cubit.dart';
import 'show_delete_confirmation_dialog.dart';
import 'show_rating_popup.dart';

class MyAppointmentsListViewItem extends StatelessWidget {
  const MyAppointmentsListViewItem({super.key, required this.appointment});
  final Order appointment;

  @override
  Widget build(BuildContext context) {
    final isCompleted = appointment.status.toLowerCase() == 'completed';
    final isUpcoming = appointment.status.toLowerCase() == 'upcoming';
    final hasStudent = appointment.student != null;

    return Container(
      margin: EdgeInsets.all(12.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Image.asset(
              AppImages.homeProfilePic,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.type,
                  style: TextStyles.font16DarkBlueMedieum.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                if (isCompleted && hasStudent) ...[
                  Text(
                    appointment.student!.fullName,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    formatDate(appointment.date),
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    appointment.time ?? '',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ] else ...[
                  Text(
                    appointment.status,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    formatDate(appointment.createdAt),
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ],
              ],
            ),
          ),
          if (isUpcoming && !hasStudent)
            IconButton(
              onPressed: () async {
                final shouldDelete = await showDeleteConfirmationDialog(
                  context,
                );
                if (shouldDelete == true) {
                  final deleteCubit = context.read<DeleteAppoinmentCubit>();
                  deleteCubit.emitDeletAppoinmentStates(appointment.id);
                }
              },
              icon: Icon(Icons.delete_outline),
              color: Colors.blue.shade900,
            )
          else if (isUpcoming && hasStudent)
            IconButton(
              onPressed: () {
                showRatingPopup(context, appointment);
              },
              icon: Icon(Icons.check_circle_outline_outlined),
              color: Colors.blue.shade900,
            ),
        ],
      ),
    );
  }

  String formatDate(String? isoDate) {
    if (isoDate == null) return '';
    final date = DateTime.tryParse(isoDate);
    if (date == null) return '';
    return DateFormat('MMMM d, y').format(date);
  }
}
