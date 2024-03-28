import 'package:flutter/material.dart';

class RabbetPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height / 1.5;
    double cutLength = 30;
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    Path path = Path()..addRect(Rect.fromLTWH(0.0, 0.0, size.width, height));

    Path innerPath = Path()
      ..addRect(Rect.fromLTWH(0.0, 0.0, cutLength, cutLength))
      ..addRect(Rect.fromLTWH(size.width - cutLength, 0.0, cutLength, cutLength))
      ..addRect(Rect.fromLTWH(size.width - cutLength, height - cutLength, cutLength, cutLength))
      ..addRect(Rect.fromLTWH(0.0, height - cutLength, cutLength, cutLength));
    path = Path.combine(PathOperation.difference, path, innerPath);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
