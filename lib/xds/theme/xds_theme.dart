import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.merriweather().fontFamily,
  primaryColor: Color.fromARGB(255, 242, 194, 194),
  accentColor: Color.fromARGB(255, 255, 219, 219),
  canvasColor: Color.fromARGB(255, 245, 228, 220),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black87,
      fontSize: 32.0,
    ),
    headline4: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
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
    ),
    button: TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
