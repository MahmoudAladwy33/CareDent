import 'package:caredent/features/home/ui/widgets/home_screen_body.dart';
import 'package:caredent/features/my_appointments/ui/my_appointments_screen.dart';
import 'package:caredent/features/profile/ui/profile_screen.dart';
import 'package:caredent/features/settings/ui/widgets/settings_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _screens = [
    HomeScreenBody(),
    MyAppointmentsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_pageIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
