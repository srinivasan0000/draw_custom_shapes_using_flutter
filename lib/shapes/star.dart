import 'dart:math' as math;

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final int numPoints;
  final double initialAngle;
  final double innerRadiusRatio;
  final Color color;

  StarPainter({this.numPoints = 5, this.initialAngle = 60, this.innerRadiusRatio = 2, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 3;
    final Path path = Path();
    final double angleStep = math.pi / numPoints;

    double angle = initialAngle;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double innerRadius = radius / innerRadiusRatio;

    for (int i = 0; i < numPoints * 2; i++) {
      final double r = i.isEven ? radius : innerRadius;
      final double x = centerX + r * math.cos(angle);
      final double y = centerY + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      angle += angleStep;
    }

    path.close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
