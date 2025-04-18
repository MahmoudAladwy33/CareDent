import 'package:caredent/core/routing/app_router.dart';
import 'package:caredent/core/theme/colors_manager.dart';
import 'package:caredent/core/theme/text_styless.dart';
import 'package:caredent/core/utlils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(16),
      children: [
        Text(
          'Account',
          style: TextStyles.font20WhiteSemiBold.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorsManager.darkBlue,
          ),
        ),
        const SizedBox(height: 8),
        _buildSettingTile(
          icon: Icons.lock_outline,
          title: 'Change Password',
          onTap: () {},
        ),
        _buildSettingTile(
          icon: Icons.person_outline,
          title: 'Edit Profile',
          onTap: () {},
        ),
        SizedBox(height: 24.h),
        Text(
          'Preferences & Advanced',
          style: TextStyles.font20WhiteSemiBold.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorsManager.darkBlue,
          ),
        ),
        SizedBox(height: 8.h),
        _buildSettingTile(
          svgAssetPath: AppImages.feedback,
          title: 'Send Feedback',
          onTap: () {},
        ),
        _buildSettingTile(
          icon: Icons.support_agent_outlined,
          title: 'Contact Support',
          onTap: () {},
        ),
        _buildSettingTile(
          svgAssetPath: AppImages.about,
          title: 'About',
          onTap: () {},
        ),
        _buildSettingTile(
          icon: Icons.logout,
          title: 'Log Out',
          iconColor: Color(0xffD9163A),
          textColor: Color(0xffD9163A),
          onTap: () async {
            final shouldLogout = await showLogoutConfirmationDialog(context);
            if (shouldLogout == true) {
              await logout(context);
            }
          },
        ),
      ],
    );
  }

  Widget _buildSettingTile({
    String? svgAssetPath,
    IconData? icon,
    required String title,
    required VoidCallback onTap,
    Color iconColor = ColorsManager.darkBlue,
    Color textColor = ColorsManager.darkBlue,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading:
            svgAssetPath != null
                ? SvgPicture.asset(
                  svgAssetPath,
                  color: iconColor,
                  width: 24,
                  height: 24,
                )
                : Icon(icon, color: iconColor),
        title: Text(
          title,
          style: TextStyles.font16DarkBlueMedieum.copyWith(color: textColor),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
    DioFactory.removeTokenFromHeader();
    GoRouter.of(context).go(AppRouter.kLoginScreen);
  }
}

/// Show custom logout confirmation dialog styled to match app design
Future<bool?> showLogoutConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: ColorsManager.lightGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.logout, color: Colors.red, size: 28),
              const SizedBox(width: 8),
              Text(
                "Log Out",
                style: TextStyles.font24DarkBlueExtraBold.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text(
            "Are you sure you want to log out?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: ColorsManager.darkBlue,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                "Log Out",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
  );
}
