import 'dart:async';

import 'package:atom_counter/orbitcanvas/components/orbit_painter.canvas.dart';
import 'package:flutter/material.dart';

class AtomCounterView extends StatefulWidget {
  const AtomCounterView({Key? key}) : super(key: key);

  @override
  State<AtomCounterView> createState() => _AtomCounterViewState();
}

class _AtomCounterViewState extends State<AtomCounterView> {
  double degree = 0.0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(
        microseconds: 50,
      ),
      (_) => setState(
        () {
          degree++;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: OrbitCanvas(
          degree: degree,
        ),
        size: const Size(
          300,
          100,
        ),
      ),
    );
  }
}
