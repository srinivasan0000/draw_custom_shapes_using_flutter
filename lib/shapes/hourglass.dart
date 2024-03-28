import 'package:flutter/material.dart';

class HourGlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const shapeWidth = 100;
    const shapeHeight = 150;

    Path path = Path();
    path.moveTo(centerX - shapeWidth / 2, centerY - shapeHeight / 2);
    path.lineTo(centerX + shapeWidth / 2, centerY - shapeHeight / 2);
    path.lineTo(centerX - shapeWidth / 2, centerY + shapeHeight / 2);
    path.lineTo(centerX + shapeWidth / 2, centerY + shapeHeight / 2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
