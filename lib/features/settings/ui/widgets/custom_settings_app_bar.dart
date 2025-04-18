import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class CustomSettingsAppBar extends StatelessWidget {
  const CustomSettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
              children: [
                Image.asset(AppImages.settingsBackground),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // GoRouter.of(context).push(AppRouter.kHomeScreen);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Settings',
                              style: TextStyles.font18DarkBlueSemiBold.copyWith(
                                color: Colors.white,
                                letterSpacing: 1.7,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              ],
            );
  }
}