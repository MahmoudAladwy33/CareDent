import 'package:caredent/features/profile/data/models/update_user_request_body.dart';
import 'package:caredent/features/profile/data/repos/update_user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this._updateUserRepo) : super(UpdateUserState.initial());

  final UpdateUserRepo _updateUserRepo;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController healthRecordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitUpdateUserStates({
    required String oldName,
    required String oldPhone,
    required String oldHealthRecord,
  }) async {
    emit(const UpdateUserState.loading());
    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    final response = await _updateUserRepo.updateUser(
      UpdateUserRequestBody(
        fullName:
            fullNameController.text.isEmpty ? oldName : fullNameController.text,
        phone: phoneController.text.isEmpty ? oldPhone : phoneController.text,
        healthRecord:
            healthRecordController.text.isEmpty
                ? oldHealthRecord
                : healthRecordController.text,
      ),
      token,
    );
    response.when(
      success: (updateUserResponse) async {
        emit(UpdateUserState.success(updateUserResponse));
      },
      failure: (apiErrorModel) {
        emit(UpdateUserState.error(apiErrorModel));
      },
    );
  }
}
