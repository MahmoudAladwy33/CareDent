import 'package:caredent/features/profile/ui/widgets/editable_profile_field.dart';
import 'package:caredent/features/profile/ui/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  String? userName;
  String? userEmail;
  String? userPhone;

  void loadUserData() async {
    final name = await getUserName();
    final email = await getUserEmail();
    final phone = await getUserPhone();
    setState(() {
      userName = name;
      userEmail = email;
      userPhone = phone;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAppBar(userName: userName ?? ''),
            EditableProfileField(title: 'User Name', value: userName ?? ''),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Email Address',
              value: userEmail ?? '',
            ),
            SizedBox(height: 12.h),
            EditableProfileField(
              title: 'Phone Number',
              value: '+20 | ${userPhone ?? ''}',
            ),
            SizedBox(height: 12.h),
            EditableProfileField(title: 'Chronic Diseases (if any)', value: ''),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }

  Future<String?> getUserName() async {
    return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
  }
}

Future<String?> getUserEmail() async {
  return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
}

Future<String?> getUserPhone() async {
  return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userPhone);
}
