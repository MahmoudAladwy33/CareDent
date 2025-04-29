import 'package:caredent/features/home/ui/widgets/get_all_reviews_on_specific_student_bloc_builder.dart';
import 'package:caredent/features/home/ui/widgets/view_all_app_bar.dart';
import 'package:flutter/material.dart';


class ViewAllScreenBody extends StatelessWidget {
  const ViewAllScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ViewAllAppBar(),
            GetAllReviewsOnSpecificStudentBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
