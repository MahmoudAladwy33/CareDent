import 'package:bloc/bloc.dart';
import 'package:caredent/features/login/logic/verify_pass_cubit/verify_password_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/models/verify_password/verify_password_request_body.dart';
import '../../data/repos/verify_password_repo.dart';


class VerifyPasswordCubit extends Cubit<VerifyPasswordState> {
  VerifyPasswordCubit(this._verifyPasswordRepo) : super(VerifyPasswordState.initial());
  final VerifyPasswordRepo _verifyPasswordRepo;


   TextEditingController otpField = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitVerifyPasswordStates() async {
    emit(const VerifyPasswordState.loading());

   

    String token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    final response = await _verifyPasswordRepo.forget(
      VerifyPasswordRequestBody(
        resetCode: otpField.text,
      ),
      token,
    );
    response.when(
      success: (verifyPasswordResponse) async {
        emit(VerifyPasswordState.success(verifyPasswordResponse));
      },
      failure: (apiErrorModel) {
        emit(VerifyPasswordState.error(apiErrorModel));
      },
    );
  }

}
