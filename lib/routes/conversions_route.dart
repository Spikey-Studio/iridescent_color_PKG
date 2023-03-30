import 'dart:math';
import 'package:flutter/material.dart';

double rad2deg(double rad) {
  double deg = rad * 180 / pi;
  return deg;
}

double rad2deg360(double rad) {
  double deg = rad * 180 / pi % 360;
  deg = deg < 0 ? deg + 360 : deg;
  return deg;
}

Color deg2Color(
  double alpha,
  double hue,
  double saturation,
  double lightness,
) {
  HSLColor hsl = HSLColor.fromAHSL(alpha, hue % 360, saturation, lightness);
  return hsl.toColor();
}
