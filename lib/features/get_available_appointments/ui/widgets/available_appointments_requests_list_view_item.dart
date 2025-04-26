import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styless.dart';
import '../../data/models/get_available_appointments_response.dart';

class AvailableAppointmentsRequestsListViewItem extends StatelessWidget {
  const AvailableAppointmentsRequestsListViewItem({
    super.key,
    required this.availableAppointment,
  });
  final Appointment availableAppointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              availableAppointment.user.profileImg == null
                  ? DefaultUserImg()
                  : CircleAvatar(
                    radius: 24.r,
                    backgroundImage: NetworkImage(
                      availableAppointment.user.profileImg!,
                    ),
                  ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      availableAppointment.user.fullName,
                      style: TextStyles.font16DarkBlueMedieum,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${availableAppointment.user.phone} - ${availableAppointment.user.healthRecord}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check,
                    size: 18.sp,
                    color: Color(0xff14AE5C),
                  ),
                  label: Text(
                    'Accept',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff045fc9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
