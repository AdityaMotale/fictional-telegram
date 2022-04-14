import 'dart:math' as math;

import 'package:atom_counter/home/orbitcanvas/atom_canvas.view.dart';
import 'package:atom_counter/home/orbitcanvas/models/electron.model.dart';
import 'package:atom_counter/home/orbitcanvas/models/orbit.models.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Orbit> _orbits = [
    Orbit(electrons: [], angle: 0),
    Orbit(electrons: [], angle: 60),
    Orbit(electrons: [], angle: 120),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AtomCounterView(
        orbits: _orbits,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _orbits[math.Random().nextInt(_orbits.length)].electrons.add(
                  Electron.addElectron(),
                );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
