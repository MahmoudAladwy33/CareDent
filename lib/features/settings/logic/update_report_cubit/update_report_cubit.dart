import 'dart:developer';
import 'package:caredent/features/settings/data/models/update_report/update_report_request_body.dart';
import 'package:caredent/features/settings/data/repos/update_report_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'update_report_state.dart';

class UpdateReportCubit extends Cubit<UpdateReportState> {
  UpdateReportCubit(this._updateReportRepo)
    : super(UpdateReportState.initial());
  final UpdateReportRepo _updateReportRepo;

  TextEditingController review = TextEditingController();

  void emitUpdateReportStates(dynamic ratings) async {
    emit(UpdateReportState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    String reportId = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.reportId,
    );
    log('reportId: $reportId');
    final response = await _updateReportRepo.updateReport(
      UpdateReportRequestBody(title: review.text, ratings: ratings),
      token,
      reportId,
    );
    response.when(
      success: (updateReportResponse) {
        emit(UpdateReportState.success(updateReportResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateReportState.error(apiErrorModel));
      },
    );
  }
}
