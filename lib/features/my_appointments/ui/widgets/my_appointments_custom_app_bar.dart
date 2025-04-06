import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class MyAppointmentsCustomAppBar extends StatelessWidget {
  const MyAppointmentsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.myAppointmentBackGround),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kHomeScreen);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'My Appointments',
                      style: TextStyles.font16DarkBlueMedieum.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.7,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.h),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyles.font16DarkBlueMedieum.copyWith(
                    color: const Color(0xffA7A7A7),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 10.w),
                    child: const Icon(Icons.search, color: Color(0xffA7A7A7)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyles.font15DarkBlueRegular.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
