import 'package:flutter/material.dart';

class ColorGen {
  final int lengthOfColors;
  ColorGen(this.lengthOfColors);
  List<Color> generateGradientColors(
      {Color startColor = Colors.white, Color endColor = Colors.black}) {
    List<Color> gradientColors = [];

    double stepR = (endColor.red - startColor.red) / (lengthOfColors - 1);
    double stepG = (endColor.green - startColor.green) / (lengthOfColors - 1);
    double stepB = (endColor.blue - startColor.blue) / (lengthOfColors - 1);

    for (int i = 0; i < lengthOfColors; i++) {
      int r = (startColor.red + stepR * i).round();
      int g = (startColor.green + stepG * i).round();
      int b = (startColor.blue + stepB * i).round();
      gradientColors.add(Color.fromRGBO(r, g, b, 1));
    }

    return gradientColors;
  }
}
