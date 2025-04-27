import 'package:caredent/features/my_appointments/ui/widgets/create_review_bloc_listener.dart';
import 'package:caredent/features/my_appointments/ui/widgets/delete_appointment_bloc_listener.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_bloc_builder.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_custom_app_bar.dart';
import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsScreenBody extends StatefulWidget {
  const MyAppointmentsScreenBody({super.key});

  @override
  State<MyAppointmentsScreenBody> createState() =>
      _MyAppointmentsScreenBodyState();
}

class _MyAppointmentsScreenBodyState extends State<MyAppointmentsScreenBody> {
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SizedBox(
      //   width: 44.w,
      //   height: 44.h,
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(36.r),
      //     ),
      //     backgroundColor: ColorsManager.mainBlue,
      //     child: Icon(Icons.add, color: Colors.white, size: 36.sp),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppointmentsCustomAppBar(),
            SizedBox(height: 11.h),
            MyAppointmentsFilter(
              onFilterChanged: (filter) {
                setState(() {
                  selectedFilter = filter;
                });
              },
            ),
            MyAppointmentsBlocBuilder(selectedFilter: selectedFilter),
            CreateReviewBlocListener(),
            DeleteAppointmentBlocListener(),
          ],
        ),
      ),
    );
  }
}
