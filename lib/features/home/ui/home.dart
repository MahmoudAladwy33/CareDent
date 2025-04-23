import 'package:caredent/features/my_appointments/ui/my_appointments_screen.dart';
import 'package:caredent/features/profile/ui/profile_screen.dart';
import 'package:caredent/features/settings/ui/widgets/settings_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _pageIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
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
