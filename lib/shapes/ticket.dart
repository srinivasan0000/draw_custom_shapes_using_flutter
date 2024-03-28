import 'package:flutter/material.dart';

class TicketPainter extends CustomPainter {
  final double radius;

  TicketPainter({this.radius = 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    var path = _getTicketPath(size);
    canvas.drawPath(path, paint);
  }

  Path _getTicketPath(Size size) {
    double height = size.height / 1.5;
    var path = Path();
    path.moveTo(radius, 0.0);
    path.arcToPoint(Offset(0.0, radius), clockwise: true, radius: Radius.circular(radius));
    path.lineTo(0.0, height - radius);
    path.arcToPoint(Offset(radius, height), clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width - radius, height);
    path.arcToPoint(Offset(size.width, height - radius), clockwise: true, radius: Radius.circular(radius));
    path.lineTo(size.width, radius);
    path.arcToPoint(Offset(size.width - radius, 0.0), clockwise: true, radius: Radius.circular(radius));
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
