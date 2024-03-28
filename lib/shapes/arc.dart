import 'package:flutter/material.dart';

enum ArcType {
  convex,
  concave,
}

class ArcPainter extends CustomPainter {
  final ArcType arcType;
  final Color color;

  ArcPainter({required this.arcType, this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var path = _getArcPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path _getArcPath(Size size) {
    var path = Path();
    double height = size.height / 1.5;
    if (arcType == ArcType.convex) {
      path.lineTo(0.0, height - height / 2);
      path.quadraticBezierTo(size.width / 4, height, size.width / 2, height);
      path.quadraticBezierTo(size.width * 3 / 4, height, size.width, height - height / 2);
      path.lineTo(size.width, 0.0);
    } else {
      path.moveTo(0.0, height);
      path.quadraticBezierTo(size.width / 4, height - height / 2, size.width / 2, height - height / 2);
      path.quadraticBezierTo(size.width * 3 / 4, height - height / 2, size.width, height);
      path.lineTo(size.width, 0.0);
      path.lineTo(0.0, 0.0);
    }
    path.close();

    return path;
  }
}
