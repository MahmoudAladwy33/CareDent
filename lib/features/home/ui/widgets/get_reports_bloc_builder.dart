import 'package:caredent/features/home/data/models/get_reports/get_reports_model.dart';
import 'package:caredent/features/home/ui/widgets/reviews_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/get_reports_cubit.dart';
import '../../logic/cubit/get_reports_state.dart';
import 'get_reports_skele_list.dart';

class GetReportsBlocBuilder extends StatelessWidget {
  const GetReportsBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReportsCubit, GetReportsState>(
      buildWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return GetReportsSkeleList();
          },
          success: (reportsData) {
            var reportList = List<Report>.from(reportsData).toList();
            return setupSuccess(reportList);
          },
          error: (error) {
            return setupError();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<Report> reportList) {
    return ReviewsListView(reportList: reportList);
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }
}
