import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styless.dart';
import '../../data/models/get_appoinments/get_my_appointments_response.dart';
import '../../logic/create_review_cubit/create_review_cubit.dart';


void showRatingPopup(BuildContext context, Order appointment) {
  final reviewCubit = context.read<CreateReviewCubit>();
  
  double rating = 0;

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder:
                        (context, _) =>
                            Icon(Icons.star, color: Colors.amber, size: 25),
                    onRatingUpdate: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Rate Your Experience",
                    style: TextStyles.font22WhiteBold.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: reviewCubit.review,
                            onChanged: (_) => setState(() {}),
                            decoration: InputDecoration(
                              hintText: "Type your feedback!...",
                              hintStyle: TextStyles.font16DarkBlueMedieum
                                  .copyWith(color: Color(0xffC8CDD6)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed:
                              (rating == 0 || reviewCubit.review.text.isEmpty)
                                  ? null
                                  : () {
                                    Navigator.of(context).pop();
                                    reviewCubit.emitCreateReviewStates(
                                      rating,
                                      appointment.student!.id,
                                      appointment.id,
                                    );
                                   
                                  },
                          icon: Icon(
                            Icons.send,
                            color:
                                (rating == 0 || reviewCubit.review.text.isEmpty)
                                    ? Colors.grey
                                    : ColorsManager.mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
