import 'package:caredent/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:caredent/features/home/ui/widgets/pick_a_service_text.dart';
import 'package:caredent/features/home/ui/widgets/service_grid_view.dart';
import 'package:caredent/features/home/ui/widgets/view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  String? userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserName();
  }

  void loadUserName() async {
    final name = await getUserName();
    setState(() {
      userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHomeAppBar(userName: userName ?? 'User Name'),
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

  Future<String?> getUserName() async {
    return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
  }
}
