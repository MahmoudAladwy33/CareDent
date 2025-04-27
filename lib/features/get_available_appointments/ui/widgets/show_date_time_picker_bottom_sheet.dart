import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/features/get_available_appointments/logic/cubit/accept_appointment_cubit.dart';
import 'package:caredent/features/get_available_appointments/logic/cubit/get_available_appointments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDateTimePickerBottomSheet(
  BuildContext context,
  String appointmentId,
  AcceptAppointmentCubit acceptAppointmentCubit,
  GetAvailableAppointmentsCubit getAvailableAppointmentsCubit,
) {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.h,
          left: 16.w,
          right: 16.w,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 40,
                    color: ColorsManager.mainBlue,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Select Date And Time",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  SizedBox(height: 16),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: ColorsManager.mainBlue,
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      onDateChanged: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: ColorsManager.mainBlue,
                                    onPrimary: Colors.white,
                                    onSurface: ColorsManager.darkBlue,
                                  ),
                                  timePickerTheme: TimePickerThemeData(
                                    dialHandColor: ColorsManager.mainBlue
                                        .withOpacity(0.6),
                                    dialBackgroundColor: Colors.blue.shade50,
                                    dialTextColor: ColorsManager.darkBlue,
                                    hourMinuteTextColor: ColorsManager.darkBlue,
                                    hourMinuteColor: Colors.transparent,
                                    dayPeriodColor:
                                        WidgetStateColor.resolveWith((states) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return ColorsManager.mainBlue;
                                          }
                                          return Colors.transparent;
                                        }),
                                    dayPeriodTextColor:
                                        WidgetStateColor.resolveWith((states) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return Colors.white;
                                          }
                                          return ColorsManager.darkBlue;
                                        }),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedTime != null) {
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            selectedTime.format(context),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Format the date
                        final formattedDate =
                            "${selectedDate.year}/${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}";

                        // Format the time in 12-hour format with am/pm
                        final hour =
                            selectedTime.hourOfPeriod == 0
                                ? 12
                                : selectedTime.hourOfPeriod;
                        final minute = selectedTime.minute.toString().padLeft(
                          2,
                          '0',
                        );
                        final period =
                            selectedTime.period == DayPeriod.am ? "am" : "pm";
                        final formattedTime = "$hour:$minute$period";

                        acceptAppointmentCubit.emitAcceptAppoinmentStates(
                          appointmentId,
                          formattedDate,
                          formattedTime,
                        );
                        // getAvailableAppointmentsCubit
                        //     .getAvailableAppointments();
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        "Confirm",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
