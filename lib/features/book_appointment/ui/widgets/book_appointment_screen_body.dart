import 'package:caredent/core/widgets/custom_button.dart';
import 'package:caredent/features/book_appointment/ui/widgets/book_appointment_body.dart';
import 'package:caredent/features/book_appointment/ui/widgets/book_appointment_header.dart';
import 'package:caredent/features/book_appointment/ui/widgets/create_appoinment_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/data/models/service_card_model.dart';
import '../../logic/cubit/create_appoinment_cubit.dart';

class BookAppointmentScreenBody extends StatelessWidget {
  const BookAppointmentScreenBody({super.key, required this.serviceCardModel});
  final ServiceCardModel serviceCardModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(serviceCardModel.appointmentImage),
          SizedBox(height: 18.h),
          BookAppointmentHeader(serviceCardModel: serviceCardModel),
          SizedBox(height: 38.h),
          BookAppointmentBody(serviceCardModel: serviceCardModel),
          SizedBox(height: 48.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
              buttonName: 'Send Request',
              onTap: () {
                context
                    .read<CreateAppoinmentCubit>()
                    .emitCreateAppoinmentStates(serviceCardModel.type);
              },
            ),
          ),
          Spacer(),
          CreateAppoinmentBlocListener(),
        ],
      ),
    );
  }
}
