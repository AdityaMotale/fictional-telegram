import 'package:atom_counter/home/orbitcanvas/helpers/helper.h.dart';
import 'package:flutter/material.dart';

class Electron {
  double speed;

  double initialSize;
  double finalSize;

  Color initialColor;
  Color finalColor;

  double _currentPositionInPercent = 0.0;

  double get electronPosition => _currentPositionInPercent;

  Electron({
    required this.speed,
    required this.finalColor,
    required this.initialColor,
    required this.initialSize,
    required this.finalSize,
  });

  void moveDegree() {
    if (_currentPositionInPercent >= 1.0) {
      _currentPositionInPercent;
    }
    _currentPositionInPercent += speed;
  }

  static Electron addElectron() {
    final initialSize = OrbitCounterHelper.randomDouble(
      minDouble: 7,
      maxDouble: 9.5,
    );
    final finalSize = initialSize * 7.5;
    return Electron(
      speed: OrbitCounterHelper.randomDouble(
        minDouble: 0.001,
        maxDouble: 0.005,
      ),
      finalColor: OrbitCounterHelper.getRandomColor(),
      initialColor: OrbitCounterHelper.getRandomColor(),
      initialSize: initialSize,
      finalSize: finalSize,
    );
  }
}
