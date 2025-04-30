import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:caredent/core/helper/constants.dart';
import 'package:caredent/core/helper/shared_pref_helper.dart';
import 'package:caredent/core/networking/dio_factory.dart';
import 'package:caredent/features/sign_up/data/models/sign_up/sign_up_request_body.dart';
import 'package:caredent/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:caredent/features/sign_up/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignupRepo _signupRepo;
  SignUpCubit(this._signupRepo) : super(SignUpState.initial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController healthRecordController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController academicController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updateDateOfBirth(int? day, int? month, int? year) {
    if (day != null && month != null && year != null) {
      String formattedDate =
          "$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
      dateOfBirthController.text = formattedDate;
    }
  }

  // تحميل البيانات المحفوظة من الـ SharedPreferences
  // Future<void> loadSavedUserData() async {
  //   String? savedFirstName =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userFirstName);
  //   String? savedLastName =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userLastName);
  //   String? savedEmail =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
  //   String? savedDateOfBirth =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userDateOfBirth);
  //   String? savedPassword =
  //       await SharedPrefHelper.getSecuredString(SharedPrefKeys.userPassword);
  //   String? savedPasswordConfirm = await SharedPrefHelper.getSecuredString(
  //       SharedPrefKeys.userPasswordConfirm);

  //   // تحميل البيانات في الـ controllers
  //   if (firstNameController.text.isEmpty) {
  //     firstNameController.text = savedFirstName;
  //   }
  //   if (lastNameController.text.isEmpty) {
  //     lastNameController.text = savedLastName;
  //   }
  //   if (emailController.text.isEmpty) {
  //     emailController.text = savedEmail;
  //   }
  //   if (dateOfBirthController.text.isEmpty) {
  //     dateOfBirthController.text = savedDateOfBirth;
  //   }
  //   if (passwordController.text.isEmpty) {
  //     passwordController.text = savedPassword;
  //   }
  //   if (passwordConfirmController.text.isEmpty) {
  //     passwordConfirmController.text = savedPasswordConfirm;
  //   }

  //   log("Loaded Data: FirstName: $savedFirstName, LastName: $savedLastName, Email: $savedEmail, Password: $savedPassword, PasswordConfirm: $savedPasswordConfirm, Date of Birth: $savedDateOfBirth");
  // }

  void updateGender(String gender) {
    genderController.text = gender;
    emit(SignUpState.initial());
  }

  void updateRole(String role) {
    roleController.text = role;
    emit(SignUpState.initial());
  }

  void emitSignupStates() async {
    // await loadSavedUserData(); //

    emit(const SignUpState.loading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        fullName: fullNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirm: passwordConfirmController.text,
        dateOfBirth: dateOfBirthController.text,
        gender: genderController.text,
        role: roleController.text,
        healthRecord: healthRecordController.text,
        skills: skillsController.text,
        year: academicController.text,
      ),
    );

    response.when(
      success: (signupResponse) async {
        // await saveUserData(
        //   firstName: firstNameController.text,
        //   lastName: lastNameController.text,
        //   email: emailController.text,
        //   password: passwordController.text,
        //   passwordConfirm: passwordConfirmController.text,
        //   dateOfBirth: dateOfBirthController.text,
        // );
        await saveUserToken(signupResponse.token ?? '');
        emit(SignUpState.success(signupResponse));
      },
      failure: (apiErrorModel) {
        emit(SignUpState.error(apiErrorModel));
      },
    );
  }

  // Future<void> saveUserData({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  //   required String passwordConfirm,
  //   required String dateOfBirth,
  // }) async {
  //   await SharedPrefHelper.setSecuredString(
  //       SharedPrefKeys.userFirstName, firstName);
  //   await SharedPrefHelper.setSecuredString(
  //       SharedPrefKeys.userLastName, lastName);
  //   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userEmail, email);
  //   await SharedPrefHelper.setSecuredString(
  //       SharedPrefKeys.userPassword, password);
  //   await SharedPrefHelper.setSecuredString(
  //       SharedPrefKeys.userPasswordConfirm, passwordConfirm);
  //   await SharedPrefHelper.setSecuredString(
  //       SharedPrefKeys.userDateOfBirth, dateOfBirth);

  //   log("Saved Data: FirstName: $firstName, LastName: $lastName, Email: $email, Password: $password, PasswordConfirm: $passwordConfirm, Date of Birth: $dateOfBirth");
  // }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterSignUp(token);
    log(
      "Saved Token: ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}",
    );
  }
}
