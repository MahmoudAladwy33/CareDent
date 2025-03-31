import 'package:caredent/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:caredent/features/home/ui/widgets/pick_a_service_text.dart';
import 'package:caredent/features/home/ui/widgets/service_grid_view.dart';
import 'package:caredent/features/home/ui/widgets/view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHomeAppBar(),
            SizedBox(height: 18.h),
            ViewAll(),
            SizedBox(height: 32.h),
            PickAServiceText(),
            SizedBox(height: 20.h),
            ServiceGridView(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
