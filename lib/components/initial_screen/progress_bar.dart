import 'package:flutter/material.dart';

class ProgressBar {
  final int nivelMaestria;
  static double maestriaMaxLevel = 6;

  const ProgressBar(this.nivelMaestria);

  static Color funcMaestriaColor(int nivelMaestria) {
    if (nivelMaestria == 1) {
      return Colors.blue;
    } else if (nivelMaestria == 2) {
      return Color(0xFF219653); // Jungle Green
    } else if (nivelMaestria == 3) {
      return Color(0xFFF2C94C); // Maize
    } else if (nivelMaestria == 4) {
      return Color(0xFFF2994A); // Pale Orange
    } else if (nivelMaestria == 5) {
      return Color(0xFFEB5757); // Coral Pink
    } else if (nivelMaestria >= 6) {
      return Color(0xFF333333); // Dark Grey
    } else {
      return Colors.grey;
    }
  }

}