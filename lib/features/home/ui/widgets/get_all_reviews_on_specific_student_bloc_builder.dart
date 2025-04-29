import 'package:caredent/features/home/data/models/get_all_reviews_on_specific_student/get_all_reviews_on_specific_student_response.dart';
import 'package:caredent/features/home/logic/get_all_reviews_on_specific_student_cubit/get_all_reviews_on_specific_student_cubit.dart';
import 'package:caredent/features/home/ui/widgets/patients_review_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../my_appointments/ui/widgets/my_appointments_list_view_skel.dart';
import '../../logic/get_all_reviews_on_specific_student_cubit/get_all_reviews_on_specific_student_state.dart';

class GetAllReviewsOnSpecificStudentBlocBuilder extends StatelessWidget {
  const GetAllReviewsOnSpecificStudentBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetAllReviewsOnSpecificStudentCubit,
      GetAllReviewsOnSpecificStudentState
    >(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return MyAppointmentsListViewSkel();
          },
          success: (reviewsData) {
            var reviewList = List<Review>.from(reviewsData).toList();
            return setupSuccess(reviewList);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<Review> reviewList) {
    return PatientsReviewListView(reviewList: reviewList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
