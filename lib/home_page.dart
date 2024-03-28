import 'shapes/arrow.dart';
import 'shapes/chevron.dart';
import 'shapes/label.dart';
import 'shapes/ticket.dart';
import 'package:flutter/material.dart';

import 'shapes/arc.dart';
import 'shapes/bevel.dart';
import 'shapes/circle.dart';
import 'shapes/cross.dart';
import 'shapes/hourglass.dart';

import 'shapes/message.dart';
import 'shapes/multiplicaton.dart';
import 'shapes/oval.dart';
import 'shapes/polygon.dart';
import 'shapes/rabbet.dart';
import 'shapes/rectangle.dart';
import 'shapes/rounded_rectangle.dart';
import 'shapes/star.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<CustomPainter> _painters = [
    CirclePainter(),
    RectanglePainter(),
    OvalPainter(),
    HourGlassPainter(),
    RoundedRectanglePainter(),
    PolygonPainter(numSides: 3, initialAngle: 30, radius: 100),
    PolygonPainter(numSides: 4, initialAngle: 30, radius: 100, color: Colors.red),
    PolygonPainter(numSides: 5, initialAngle: 30, radius: 100, color: Colors.blue),
    PolygonPainter(numSides: 6, initialAngle: 30, radius: 100),
    PolygonPainter(numSides: 10, initialAngle: 30, radius: 100, color: Colors.red),
    CrossPainter(),
    MultiplicationPainter(),
    StarPainter(color: Colors.red),
    StarPainter(numPoints: 6, initialAngle: 0, color: Colors.blue),
    StarPainter(numPoints: 20, initialAngle: 0, innerRadiusRatio: 1.2, color: Colors.green),
    MessagePainter(10, 40, 50, 100),
    ArrowPainter(arrowHeight: 200, arrowWidth: 150, clipHeight: 60),
    LabelPainter(),
    ChevronPainter(),
    ArcPainter(arcType: ArcType.concave),
    ArcPainter(arcType: ArcType.convex, color: Colors.green),
    TicketPainter(radius: 25),
    RabbetPainter(),
    BevelPainter()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shapes Using CustomPaint "),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _painters.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(40),
              color: index.isEven ? Colors.grey[200] : Colors.grey[300],
              height: 280,
              child: CustomPaint(
                painter: _painters[index],
              ),
            );
          },
        ));
  }
}
