import 'package:flutter/material.dart';

class CrossPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const double armLength = 80;
    const double armWidth = 40;

    final path = Path();

    path.moveTo(centerX - armWidth / 2, centerY - armLength);
    path.lineTo(centerX + armWidth / 2, centerY - armLength);

    path.lineTo(centerX + armWidth / 2, centerY - armWidth / 2);
    path.lineTo(centerX + armLength, centerY - armWidth / 2);

    path.lineTo(centerX + armLength, centerY + armWidth / 2);
    path.lineTo(centerX + armWidth / 2, centerY + armWidth / 2);

    path.lineTo(centerX + armWidth / 2, centerY + armLength);
    path.lineTo(centerX - armWidth / 2, centerY + armLength);

    path.lineTo(centerX - armWidth / 2, centerY + armWidth / 2);
    path.lineTo(centerX - armLength, centerY + armWidth / 2);

    path.lineTo(centerX - armLength, centerY - armWidth / 2);
    path.lineTo(centerX - armWidth / 2, centerY - armWidth / 2);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
