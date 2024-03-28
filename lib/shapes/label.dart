import 'package:flutter/material.dart';

class LabelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var path = _getArrowPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _getArrowPath(Size size) {
    double height = size.height / 1.5;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 70, height / 2);
    path.lineTo(size.width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }
}
