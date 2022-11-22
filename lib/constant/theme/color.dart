import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF0060FF);
  static Color primaryLight = const Color.fromARGB(255, 225, 241, 255);
  static Color secondaryColor = const Color.fromARGB(255, 194, 216, 252);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color blackGrey = const Color.fromARGB(255, 39, 39, 39);
  static Color backgroundBlack = const Color.fromARGB(255, 37, 37, 37);
  static Color backgroundWhite = const Color.fromARGB(255, 255, 255, 255);
  static Color backgroundGray = const Color.fromARGB(255, 240, 240, 240);
  static Color transparent = Colors.transparent;

  static MaterialColor primarySwatch = const MaterialColor(
    0xFF489E83,
    {
      50: Color(0xffb3c5e1),
      100: Color(0xff96aacb),
      200: Color(0xff8299be),
      300: Color(0xff718ab4),
      400: Color(0xff6483b6),
      500: Color(0xFF516FA2),
      600: Color(0xff49689b),
      700: Color(0xff425e8d),
      800: Color(0xff344b73),
      900: Color(0xff283c59),
    },
  );
}