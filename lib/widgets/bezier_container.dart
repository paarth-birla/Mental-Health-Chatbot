// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mental_fitness_solution/widgets/custom_clipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key? key, required this.color1, required this.color2}) : super(key: key);
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: MediaQuery.of(context).size.height *.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color1,color2]
              )
            ),
        ),
      ),
      )
    );
  }
}