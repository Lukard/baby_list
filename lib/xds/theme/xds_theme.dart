import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.merriweather().fontFamily,
  primaryColor: Color.fromARGB(255, 242, 194, 194),
  accentColor: Color.fromARGB(255, 255, 219, 219),
  canvasColor: Color.fromARGB(255, 245, 228, 220),
  cardColor: Color.fromARGB(255, 245, 228, 220),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black87,
      fontSize: 48.0,
    ),
    headline3: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
    bodyText1: TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      color: Colors.black54,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      height: 1.25,
    ),
    button: TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
