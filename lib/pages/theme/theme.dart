import 'dart:ui';

import 'package:flutter/material.dart';

class RainbowTheme {
  static int? index = 0;

  RainbowTheme(int index) {
    RainbowTheme.index = index;
  }

  static Color primary_1 = index == 0
      ? Colors.blueAccent
      : index == 1
          ? Colors.green
          : Colors.black;

  static Color variant = index == 0
      ? Colors.blue
      : index == 1
          ? Colors.greenAccent
          : Colors.grey;

  static Color primary_2 = index == 0
      ? Colors.blueAccent
      : index == 1
          ? Colors.lightGreen
          : Colors.black;

  static Color dark_primary = index == 0
      ? Color.fromARGB(255, 5, 102, 182)
      : index == 1
          ? Color.fromARGB(255, 98, 177, 8)
          : Colors.black;

  static const Color secondary = Colors.white;

  static const Color hint = Colors.grey;

  static const Color letter = Colors.black;

  static const String fontFamilyPrimary = 'Roboto';

  static TextStyle colorTitle = TextStyle(
      fontFamily: 'Montserrat',
      color: RainbowTheme.primary_1,
      fontSize: 25,
      height: 1,
      fontWeight: FontWeight.w600);
}
