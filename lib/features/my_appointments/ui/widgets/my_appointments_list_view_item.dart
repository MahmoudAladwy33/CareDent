import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:caredent/features/my_appointments/data/models/get_my_appointments_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../logic/create_review_cubit/create_review_cubit.dart';
import '../../logic/get_appoinments_cubit/get_my_appointments_cubit.dart';

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
          // الحالة الوحيدة اللي نعرض فيها أيقونة:
          if (isUpcoming && !hasStudent) //  لو Upcoming ومفيش student
            IconButton(
              onPressed: () {
                // Handle delete here
              },
              icon: Icon(Icons.delete_outline),
              color: Colors.blue.shade900,
            )
          else if (isUpcoming && hasStudent) //  لو Upcoming وفي student
            IconButton(
              onPressed: () {
                showRatingPopup(context);
              },
              icon: Icon(Icons.check_circle_outline_outlined),
              color: Colors.blue.shade900,
            ),
          // Completed → مفيش أيقونة
        ],
      ),
    );
  }

  String formatDate(String? isoDate) {
    if (isoDate == null) return '';
    final date = DateTime.tryParse(isoDate);
    if (date == null) return '';
    return DateFormat('MMMM d, y').format(date); // November 10, 2025
  }

  void showRatingPopup(BuildContext context) {
    final reviewCubit = BlocProvider.of<CreateReviewCubit>(context);
    final appointmentsCubit = BlocProvider.of<GetMyAppointmentsCubit>(context);
    double rating = 0;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFFF9F9F9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder:
                          (context, _) =>
                              Icon(Icons.star, color: Colors.amber, size: 25),
                      onRatingUpdate: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Rate Your Experience",
                      style: TextStyles.font22WhiteBold.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.darkBlue,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: reviewCubit.review,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: "Type your feedback!...",
                                hintStyle: TextStyles.font16DarkBlueMedieum
                                    .copyWith(color: Color(0xffC8CDD6)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed:
                                (rating == 0 || reviewCubit.review.text.isEmpty)
                                    ? null
                                    : () {
                                      Navigator.of(context).pop();

                                      reviewCubit.emitCreateReviewStates(
                                        rating,
                                        appointment.student!.id,
                                        appointment.id,
                                      );
                                      appointmentsCubit.getMyAppointments();
                                    },
                            icon: Icon(
                              Icons.send,
                              color:
                                  (rating == 0 ||
                                          reviewCubit.review.text.isEmpty)
                                      ? Colors.grey
                                      : ColorsManager.mainBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
