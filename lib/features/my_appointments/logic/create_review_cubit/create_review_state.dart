import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_model.dart';
part 'create_review_state.freezed.dart';

@freezed
class CreateReviewState<T> with _$CreateReviewState<T> {
  const factory CreateReviewState.initial() = _Initial;
  const factory CreateReviewState.loading() = Loading;
  const factory CreateReviewState.success(T data) = Success;
  const factory CreateReviewState.error(ApiErrorModel apiErrorModel) = Error;
}
