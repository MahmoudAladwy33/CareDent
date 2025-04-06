import 'package:caredent/features/home/ui/widgets/reviews_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_styless.dart';
import '../../../../core/utlils/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.homeAppBarBackground),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Text(
                          'Welcome back',
                          style: TextStyles.font16DarkBlueMedieum.copyWith(
                            color: Colors.white,
                            letterSpacing: 1.7,
                          ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        userName,
                        style: TextStyles.font20WhiteSemiBold.copyWith(
                          letterSpacing: 1.7,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h),
                    child: Image.asset(
                      AppImages.homeProfilePic,
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  hintStyle: TextStyles.font16DarkBlueMedieum.copyWith(
                    color: const Color(0xffA7A7A7),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 10.w),
                    child: const Icon(Icons.search, color: Color(0xffA7A7A7)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyles.font15DarkBlueRegular.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                'What our patients say',
                style: TextStyles.font16DarkBlueMedieum.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 238.h), child: ReviewsListView()),
      ],
    );
  }
}
