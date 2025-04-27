import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../data/models/get_student_appointments/get_student_appointments_response.dart';

class GetStudentAppointmentsListViewItem extends StatelessWidget {
  const GetStudentAppointmentsListViewItem({
    super.key,
    required this.appointment,
  });
  final Order appointment;

  @override
  Widget build(BuildContext context) {
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
          appointment.user.profileImg == null
              ? DefaultUserImg()
              : ClipRRect(
                borderRadius: BorderRadius.circular(40.r),
                child: Image.network(
                  appointment.user.profileImg!,
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

                Text(
                  appointment.user.fullName,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Text(
                      formatDate(appointment.date),
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      appointment.time,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsManager.mainBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
