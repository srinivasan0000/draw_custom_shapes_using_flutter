import 'package:flutter/material.dart';

class ArrowPainter extends CustomPainter {
  final double arrowWidth;
  final double arrowHeight;
  final double clipHeight;

  ArrowPainter({required this.arrowWidth, required this.arrowHeight, required this.clipHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var path = _getArrowPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path _getArrowPath(Size size) {
    var path = Path();
    path.moveTo(0.0, clipHeight);
    path.lineTo(size.width - arrowWidth, clipHeight);
    path.lineTo(size.width - arrowWidth, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - arrowWidth, size.height);
    path.lineTo(size.width - arrowWidth, size.height - clipHeight);
    path.lineTo(0.0, size.height - clipHeight);
    path.close();
    return path;
  }
}
