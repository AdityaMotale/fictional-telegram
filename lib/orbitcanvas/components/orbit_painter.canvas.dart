import 'package:flutter/material.dart';
import 'dart:math' as math;

class OrbitCanvas extends CustomPainter {
  final double degree;

  OrbitCanvas({required this.degree});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final centerOffSet = Offset(
      width,
      height,
    );
    final rect = Rect.fromCenter(
      center: centerOffSet,
      width: width,
      height: height,
    );
    canvas.drawOval(
      rect,
      Paint()
        ..color = Colors.white70
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    final rads = _degreeToRads(degree: degree);
    final electronOffset = centerOffSet +
        Offset(
          math.cos(rads) * (width * 0.5),
          math.sin(rads) * (height * 0.5),
        );
    canvas.drawCircle(
      electronOffset,
      8,
      Paint()..color = Colors.amberAccent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double _degreeToRads({required double degree}) {
    return (degree * math.pi) / 180.0;
  }
}
