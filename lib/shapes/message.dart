import 'package:flutter/material.dart';

class MessagePainter extends CustomPainter {
  MessagePainter(this.leftBaseX, this.pointX, this.rightBaseX, this.baseY);

  final double leftBaseX;
  final double rightBaseX;
  final double pointX;
  final double baseY;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    var path = Path();
    path.lineTo(0.0, size.height - baseY);
    path.lineTo(leftBaseX, size.height - baseY);
    path.lineTo(pointX, size.height);
    path.lineTo(rightBaseX, size.height - baseY);
    path.lineTo(size.width, size.height - baseY);
    path.lineTo(size.width, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
