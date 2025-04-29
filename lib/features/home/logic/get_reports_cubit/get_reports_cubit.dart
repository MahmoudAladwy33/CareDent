import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../data/repos/get_reports_repo.dart';
import 'get_reports_state.dart';

class GetReportsCubit extends Cubit<GetReportsState> {
  GetReportsCubit(this._getReportsRepo) : super(GetReportsState.initial());
  final GetReportsRepo _getReportsRepo;

  void getReports() async {
    emit(GetReportsState.loading());

    String token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );
    final response = await _getReportsRepo.getReports(token);
    response.when(
      success: (getReportsResponse) {
        emit(GetReportsState.success(getReportsResponse.reports));
      },
      failure: (apiErrorModel) {
        emit(GetReportsState.error(apiErrorModel));
      },
    );
  }
}
