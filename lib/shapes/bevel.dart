import 'package:flutter/material.dart';

class BevelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    double height = size.height / 1.5;
    double cutLength = 30;

    Path path = Path()
      ..moveTo(0.0, cutLength)
      ..lineTo(cutLength, 0.0)
      ..lineTo(size.width - cutLength, 0.0)
      ..lineTo(size.width, cutLength)
      ..lineTo(size.width, height - cutLength)
      ..lineTo(size.width - cutLength, height)
      ..lineTo(cutLength, height)
      ..lineTo(0.0, height - cutLength)
      ..lineTo(0.0, cutLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
