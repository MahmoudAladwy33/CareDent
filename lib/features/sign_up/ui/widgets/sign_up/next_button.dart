import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomButton(buttonName: 'Next', onTap: onTap);
  }
}
