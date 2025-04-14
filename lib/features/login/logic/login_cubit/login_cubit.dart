import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:caredent/core/helper/constants.dart';
import 'package:caredent/core/helper/shared_pref_helper.dart';
import 'package:caredent/core/networking/dio_factory.dart';
import 'package:caredent/features/login/data/models/login/login_request_body.dart';
import 'package:caredent/features/login/data/repos/login_repo.dart';
import 'package:caredent/features/login/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/logic/user_cubit/user_cubit.dart';
import '../../../../core/models/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo, this.userCubit) : super(LoginState.initial());
  final LoginRepo _loginRepo;
  final UserCubit userCubit;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.token ?? '');
        final userModel = UserModel.fromJson(loginResponse.data.toJson());
        log("👤 Login data: ${loginResponse.data.toJson()}");
        userCubit.setUser(userModel);

        // await saveUserData(
        //   loginResponse.data.fullName ?? '',
        //   loginResponse.data.email ?? '',
        //   loginResponse.data.phone ?? '',
        // );
        emit(LoginState.success(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.error(apiErrorModel));
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

  // Future<void> saveUserData(String userName, String email, String phone) async {
  //   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userName, userName);
  //   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userEmail, email);
  //   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userPhone, phone);

  //   log(
  //     "Saved UserName: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName)}",
  //   );
  // }
}
