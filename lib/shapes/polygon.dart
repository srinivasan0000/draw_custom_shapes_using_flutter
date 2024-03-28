import 'dart:math' as math;
import 'package:flutter/material.dart';

class PolygonPainter extends CustomPainter {
  final int numSides;
  final double radius;
  final Color color;
  final double initialAngle;

  PolygonPainter({
    required this.numSides,
    required this.radius,
    this.color = Colors.green,
    this.initialAngle = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = _buildPolygonPath(size);
    final Paint paint = _createPaint();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path _buildPolygonPath(Size size) {
    final Path path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double angleStep = 2 * math.pi / numSides;

    double angle = initialAngle - .155;

    final double startX = centerX + radius * math.cos(angle);
    final double startY = centerY + radius * math.sin(angle);
    path.moveTo(startX, startY);

    for (int i = 1; i <= numSides; i++) {
      angle += angleStep;
      final double x = centerX + radius * math.cos(angle);
      final double y = centerY + radius * math.sin(angle);
      path.lineTo(x, y);
    }

    path.close();
    return path;
  }

  Paint _createPaint() {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    return paint;
  }
}
