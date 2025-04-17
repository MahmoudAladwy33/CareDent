import 'package:caredent/core/models/user_model.dart';
import 'package:caredent/core/widgets/default_user_img.dart';
import 'package:caredent/features/profile/ui/widgets/user_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330.h,
      child: Stack(
        children: [
          Image.asset(
            AppImages.profileBackground,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyles.font16DarkBlueMedieum.copyWith(
                            color: Colors.white,
                            letterSpacing: 1.7,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          user.name,
                          style: TextStyles.font20WhiteSemiBold.copyWith(
                            letterSpacing: 1.7,
                          ),
                        ),
                      ],
                    ),
                    (user.profileImg != null &&
                            user.profileImg!.trim().isNotEmpty)
                        ? Container(
                          width: 42.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(user.profileImg!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        : DefaultUserImg(),
                  ],
                ),
              ],
            ),
          ),
          UserProfilePic(),
        ],
      ),
    );
  }
}
