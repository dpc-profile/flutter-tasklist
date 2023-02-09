import 'package:flutter/material.dart';

class ProgressBar {
  final int nivelMaestria;
  static double maestriaMaxLevel = 6;

  const ProgressBar(this.nivelMaestria);

  static Color maestria(int nivelMaestria) {
    if (nivelMaestria == 1) {
      return Colors.blue;
    } else if (nivelMaestria == 2) {
      return Colors.green;
    } else if (nivelMaestria == 3) {
      return Colors.yellow[600]!;
    } else if (nivelMaestria == 4) {
      return Colors.orange;
    } else if (nivelMaestria == 5) {
      return Colors.red;
    } else if (nivelMaestria >= 6) {
      return Colors.black;
    } else {
      return Colors.grey;
    }
  }

}