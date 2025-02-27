import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/theme/colors_manager.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CareDent extends StatelessWidget {
  const CareDent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        routerConfig: AppRouter.router,
        title: 'CareDent',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
