import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstantsColor {
  static const Color appBarColor = Colors.purple;
  static const Color textColor1 = Colors.white;
  static const Color textColor2 = Colors.purple;
  static const Color textColor3 = Colors.deepPurple;
  static const LinearGradient gradientColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.8],
      colors: [Colors.purple, Colors.deepPurple]);
}
