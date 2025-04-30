import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class RoleSelectionAppBar extends StatelessWidget {
  const RoleSelectionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      title: 'Start your journey',
      subTitle: 'Please complete the following',
    );
    
  }
}