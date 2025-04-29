import 'package:caredent/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/get_all_reviews_on_specific_student/get_all_reviews_on_specific_student_response.dart';
part 'get_all_reviews_on_specific_student_state.freezed.dart';

@freezed
class GetAllReviewsOnSpecificStudentState<T>
    with _$GetAllReviewsOnSpecificStudentState<T> {
  const factory GetAllReviewsOnSpecificStudentState.initial() = _Initial;
  const factory GetAllReviewsOnSpecificStudentState.loading() = Loading;
  const factory GetAllReviewsOnSpecificStudentState.success(
    List<Review> reviews,
  ) = Success;

  const factory GetAllReviewsOnSpecificStudentState.error(ApiErrorModel apiErrorModel ) = Error;
}
