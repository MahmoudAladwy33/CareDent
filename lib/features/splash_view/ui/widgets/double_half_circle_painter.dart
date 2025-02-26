import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/theme/colors_manager.dart';

class DoubleHalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = ColorsManager.mainBlue
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    double arcAngle = pi * 0.5;
    double spacingAngle = pi * 0.3;

    canvas.drawArc(rect, -pi / 2 - spacingAngle / 2, arcAngle, false, paint);

    canvas.drawArc(rect, pi / 2 - spacingAngle / 2, arcAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
