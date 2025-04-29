import 'package:caredent/features/home/data/repos/get_all_reviews_on_specific_student_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'get_all_reviews_on_specific_student_state.dart';

class GetAllReviewsOnSpecificStudentCubit
    extends Cubit<GetAllReviewsOnSpecificStudentState> {
  GetAllReviewsOnSpecificStudentCubit(this._getAllReviewsOnSpecificStudentRepo)
    : super(GetAllReviewsOnSpecificStudentState.initial());

  final GetAllReviewsOnSpecificStudentRepo _getAllReviewsOnSpecificStudentRepo;

  void getReports(String studentId) async {
    emit(GetAllReviewsOnSpecificStudentState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _getAllReviewsOnSpecificStudentRepo
        .getAllReviewsOnSpecificStudent(token, studentId);
    response.when(
      success: (getAllReviewsOnSpecificStudentResponse) {
        emit(
          GetAllReviewsOnSpecificStudentState.success(
            getAllReviewsOnSpecificStudentResponse.reviews,
          ),
        );
      },
      failure: (apiErrorModel) {
        emit(GetAllReviewsOnSpecificStudentState.error(apiErrorModel));
      },
    );
  }
}
