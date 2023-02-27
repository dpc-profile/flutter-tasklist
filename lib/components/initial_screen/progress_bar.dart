import 'package:first_project_alura/components/custom_colors.dart';
import 'package:flutter/material.dart';

class ProgressBar {
  final int nivelMaestria;
  static double maestriaMaxLevel = 6;

  const ProgressBar(this.nivelMaestria);

  static Color funcMaestriaColor(int nivelMaestria) {
    if (nivelMaestria == 2) {
      return CustomColors.jungleGreen;
    } else if (nivelMaestria == 3) {
      return CustomColors.maize;
    } else if (nivelMaestria == 4) {
      return CustomColors.paleOrange;
    } else if (nivelMaestria == 5) {
      return CustomColors.coralPink;
    } else if (nivelMaestria >= 6) {
      return CustomColors.darkGrey;
    }

    return Colors.blue;
  }

}