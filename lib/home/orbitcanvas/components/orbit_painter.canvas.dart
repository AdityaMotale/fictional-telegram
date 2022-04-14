import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/orbit.models.dart';

class OrbitCanvas extends CustomPainter {
  final Orbit orbits;

  OrbitCanvas({required this.orbits});

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final centerOffSet = Offset(
      width * 0.5,
      height * 0.5,
    );
    final rect = Rect.fromCenter(
      center: centerOffSet,
      width: width,
      height: height,
    );
    canvas.drawOval(
      rect,
      Paint()
        ..color = const Color(0xFF26224f)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    for (var element in orbits.electrons) {
      element.initialSize =
          lerpDouble(element.initialSize, element.finalSize, 0.09)!;
      element.initialColor =
          Color.lerp(element.initialColor, element.finalColor, 0.09)!;
      final radsVal = math.pi * 2 * element.electronPosition;
      final electronOffset = centerOffSet +
          Offset(
            math.cos(radsVal) * (width / 2),
            math.sin(radsVal) * (height / 2),
          );
      canvas.drawCircle(
        electronOffset,
        element.initialSize / 2,
        Paint()
          ..color = element.initialColor
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round
          ..strokeWidth = element.initialSize,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

double degreeToRads({required double degree}) {
  return (degree * math.pi) / 180.0;
}
