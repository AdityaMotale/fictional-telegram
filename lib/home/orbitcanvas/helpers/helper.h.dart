import 'dart:math';

import 'package:flutter/material.dart';

import '../models/orbit.models.dart';

class OrbitCounterHelper {
  static double randomDouble(
      {required double minDouble, required double maxDouble}) {
    return Random().nextDouble() * (maxDouble - minDouble) + minDouble;
  }

  static List colors = [
    Colors.greenAccent,
    Colors.redAccent,
    Colors.cyanAccent,
    Colors.purpleAccent,
    Colors.yellowAccent,
  ];

  static Color getRandomColor() {
    return colors[Random().nextInt(
      colors.length,
    )];
  }
}

extension OrbitCounterExtension on List<Orbit> {
  void moveElectronPosition() {
    forEach((orbit) {
      for (var electron in orbit.electrons) {
        electron.moveDegree();
      }
    });
  }
}
