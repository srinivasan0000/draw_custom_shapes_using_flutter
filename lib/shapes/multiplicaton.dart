import 'package:flutter/material.dart';
import 'dart:math' as math;

class MultiplicationPainter extends CustomPainter {
  final double armLength; // Length of each diagonal line segment
  final double strokeWidth;
  final Color strokeColor;

  MultiplicationPainter({this.armLength = 30.0, this.strokeWidth = 5.0, this.strokeColor = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const double armLength = 60;
    const double armWidth = 30;

    // const double angleStep = (2 * math.pi) / 8;
    final double radius = size.width / 3;
    Path path1 = Path();
    path1.moveTo(centerX, centerY);

    path1.lineTo(centerX + armWidth / 2 + armLength, centerY + armLength * math.sin(45));
    path1.lineTo(centerX + armWidth + armLength, centerY - armLength - armWidth / 2 + radius * math.sin(45));
    path1.lineTo(centerX + armWidth / 2, centerY - armWidth);
    path1.lineTo(centerX + armWidth + armLength, centerY + radius * math.sin(180));
    path1.lineTo(centerX + armLength, centerY - armWidth + radius * math.sin(180));
    path1.lineTo(centerX, centerY - armLength);
    path1.lineTo(centerX - armLength, centerY - armWidth + radius * math.sin(180));
    path1.lineTo(centerX - armWidth - armLength, centerY + radius * math.sin(180));
    path1.lineTo(centerX - armWidth / 2, centerY - armWidth);
    path1.lineTo(centerX - armWidth - armLength, centerY - armLength + radius * math.sin(40));
    path1.lineTo(centerX - armWidth / 2 - armLength, centerY + armLength * math.sin(45));
    path1.lineTo(centerX, centerY);

    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
