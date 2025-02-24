import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareDent extends StatelessWidget {
  const CareDent({super.key});

  @override
  Widget build(BuildContext context) {
  return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        // initialRoute: Routes.onBoardingScreen,
        // onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
