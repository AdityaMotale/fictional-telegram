import 'dart:async';

import 'package:atom_counter/home/orbitcanvas/components/orbit_painter.canvas.dart';
import 'package:atom_counter/home/orbitcanvas/helpers/helper.h.dart';
import 'package:atom_counter/home/orbitcanvas/models/orbit.models.dart';
import 'package:flutter/material.dart';

class AtomCounterView extends StatefulWidget {
  final List<Orbit> orbits;
  const AtomCounterView({
    Key? key,
    required this.orbits,
  }) : super(key: key);

  @override
  State<AtomCounterView> createState() => _AtomCounterViewState();
}

class _AtomCounterViewState extends State<AtomCounterView> {
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
          widget.orbits.moveElectronPosition();
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
    final atomSize = (MediaQuery.of(context).size.shortestSide / 3) * 2;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Stack(
              children: widget.orbits
                  .map(
                    (orbit) => Center(
                      child: Transform.rotate(
                        angle: degreeToRads(degree: orbit.angle),
                        child: CustomPaint(
                          painter: OrbitCanvas(
                            orbits: orbit,
                          ),
                          size: Size(atomSize, atomSize),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Center(
              child: Container(
                width: atomSize / 10,
                height: atomSize / 10,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffffc560),
                        Color(0xffff593b),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
