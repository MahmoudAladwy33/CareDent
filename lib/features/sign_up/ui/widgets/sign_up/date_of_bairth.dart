import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; // استيراد مكتبة intl لتنسيق التاريخ

class DateOfBirthField extends StatefulWidget {
  final TextEditingController? controller;

  const DateOfBirthField({super.key, this.controller});

  @override
  DateOfBirthFieldState createState() => DateOfBirthFieldState();
}

class DateOfBirthFieldState extends State<DateOfBirthField> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      dateController.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorsManager.mainBlue,
            hintColor: ColorsManager.mainBlue,
            colorScheme: ColorScheme.light(
              primary: ColorsManager.mainBlue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20),
              SizedBox(width: 8.w),
              Text("Date Of Birth", style: TextStyles.font16DarkBlueMedieum),
            ],
          ),
          SizedBox(height: 8.h),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Date of birth is required';
              }
              return null;
            },
            controller: dateController,
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffe5e9ef),
              hintText: "YYYY-MM-DD",
              hintStyle: TextStyles.font14GrayRegular,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorsManager.mainBlue),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
