import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/generated/colors.gen.dart';

class MakeCircle extends CustomPainter {
  final double strokeWidth;
  final StrokeCap strokeCap;

  MakeCircle({this.strokeCap = StrokeCap.square, this.strokeWidth = 40.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ColorName.materialPrimary
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke; //important set stroke style

    final path = Path()
      ..moveTo(strokeWidth, strokeWidth)
      ..arcToPoint(Offset(size.width - strokeWidth, size.height - strokeWidth),
          radius: Radius.circular(max(size.width, size.height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}