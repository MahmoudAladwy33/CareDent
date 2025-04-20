import 'package:caredent/features/my_appointments/data/models/create_review/create_review_request_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/repos/create_review_repo.dart';
import 'create_review_state.dart';

class CreateReviewCubit extends Cubit<CreateReviewState> {
  CreateReviewCubit(this._createReviewRepo)
    : super(CreateReviewState.initial());

  final CreateReviewRepo _createReviewRepo;

  TextEditingController review = TextEditingController();

  void emitCreateReviewStates(
    dynamic ratings,
    String studentId,
    String appointmentId,
  ) async {
    emit(CreateReviewState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _createReviewRepo.createAppoinment(
      CreateReviewRequestBody(
        title: review.text,
        ratings: ratings,
        studentId: studentId,
        appointmentId: appointmentId,
      ),
      token,
    );
    response.when(
      success: (createReviewResponse) async {
        emit(CreateReviewState.success(createReviewResponse));
      },
      failure: (apiErrorModel) {
        emit(CreateReviewState.error(apiErrorModel));
      },
    );
  }
}
