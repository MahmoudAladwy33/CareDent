import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:caredent/features/login/logic/forget_pass_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../data/models/forget_password/forget_pass_email_request_body.dart';
import '../../data/repos/forget_pass_repo.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPassRepo)
    : super(ForgetPasswordState.initial());
  final ForgetPassRepo _forgetPassRepo;
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Future<void> loadSavedEmail() async {
  //   String? savedEmail = await SharedPrefHelper.getSecuredString(
  //     SharedPrefKeys.userEmail,
  //   );
  //   if (emailController.text.isEmpty) {
  //     emailController.text = savedEmail; // تحميل الإيميل المحفوظ
  //     log("Loaded Email: $savedEmail");
  //   }
  // }

  void emitForgetPasswordStates() async {
    // await loadSavedEmail();
    emit(const ForgetPasswordState.loading());

    final response = await _forgetPassRepo.forget(
      ForgetPassEmailRequestBody(email: emailController.text),
    );
    response.when(
      success: (forgetPassResponse) async {
        await saveUserToken(forgetPassResponse.token ?? '');

        // await saveEmail();

        emit(ForgetPasswordState.success(forgetPassResponse));
      },
      failure: (apiErrorModel) {
        emit(ForgetPasswordState.error(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log(
      "Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    );
  }

  // Future<void> saveEmail() async {
  //   await SharedPrefHelper.setSecuredString(
  //     SharedPrefKeys.userEmail,
  //     emailController.text,
  //   );
  //   log(
  //     "Saved Email: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail)}",
  //   );
  // }
}
