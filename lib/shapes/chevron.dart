import 'package:flutter/material.dart';

class ChevronPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var path = _getChevronPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _getChevronPath(Size size) {
    double height = size.height / 1.5;
    double triangleWidth = 70;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - triangleWidth, 0);
    path.lineTo(size.width, height / 2);
    path.lineTo(size.width - triangleWidth, height);
    path.lineTo(0, height);
    path.lineTo(triangleWidth, height / 2);
    path.close();
    return path;
  }
}
