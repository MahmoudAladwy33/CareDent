import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/models/verify_account/verify_account_request_body.dart';
import '../../data/repos/verify_account_repo.dart';
import 'verify_account_state.dart';

class VerifyAccountCubit extends Cubit<VerifyAccountState> {
  VerifyAccountCubit(this._verifyAccountRepo)
    : super(VerifyAccountState.initial());
  final VerifyAccountRepo _verifyAccountRepo;

  final formKey = GlobalKey<FormState>();
  TextEditingController otpField = TextEditingController();

  void emitVerifyAccountStates() async {
    emit(const VerifyAccountState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    log("JWT Token: $token");
    final response = await _verifyAccountRepo.verify(
      VerifyAccountRequestBody(code: otpField.text),
      token,
    );
    response.when(
      success: (verifyAccountResponse) async {
        emit(VerifyAccountState.success(verifyAccountResponse));
      },
      failure: (apiErrorModel) {
        emit(VerifyAccountState.error(apiErrorModel));
      },
    );
  }
}
