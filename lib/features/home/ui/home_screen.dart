import 'package:caredent/features/home/ui/widgets/home_screen_body.dart';
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
    const Center(child: Text('Chat Screen')),
    const Center(child: Text('Settings Screen')),
    const Center(child: Text('Profile Screen')),
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
