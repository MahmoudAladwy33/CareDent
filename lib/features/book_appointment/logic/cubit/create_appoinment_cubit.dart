import 'package:caredent/features/book_appointment/data/models/create_appoinment_request_body.dart';
import 'package:caredent/features/book_appointment/data/repos/create_appoinment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import 'create_appoinment_state.dart';

class CreateAppoinmentCubit extends Cubit<CreateAppoinmentState> {
  CreateAppoinmentCubit(this._createAppoinmentRepo)
    : super(CreateAppoinmentState.initial());

  final CreateAppoinmentRepo _createAppoinmentRepo;

  void emitCreateAppoinmentStates(String type) async {
    emit(const CreateAppoinmentState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _createAppoinmentRepo.createAppoinment(
      CreateAppoinmentRequestBody(type: type),
      token,
    );
    response.when(
      success: (createAppoinmentResponse) async {
        emit(CreateAppoinmentState.success(createAppoinmentResponse));
      },
      failure: (apiErrorModel) {
        emit(CreateAppoinmentState.error(apiErrorModel));
      },
    );
  }
}
