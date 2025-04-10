import 'package:caredent/features/my_appointments/ui/widgets/my_appointments_filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsFilter extends StatefulWidget {
  const MyAppointmentsFilter({super.key});

  @override
  State<MyAppointmentsFilter> createState() => _MyAppointmentsFilterState();
}

class _MyAppointmentsFilterState extends State<MyAppointmentsFilter> {
  final bool isSelected = false;

  int selectedIndex = 1;
  final List<String> filters = ['All', 'Upcoming', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: List.generate(filters.length, (index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: MyAppointmentsFilterItem(
              title: filters[index],
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
