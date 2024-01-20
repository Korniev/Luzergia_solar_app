import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static const Color pantone1 = Color(0xFF16375B);
  static const Color pantone2 = Color(0xFF4CBAB2);
  static const Color pantone3 = Color(0xFFA5D2D5);
  static const Color pantone4 = Color(0xFF444D57);
  static const Color pantone5 = Color(0xFFD5D921);
  static const Color white = Color(0xFFFFFFFF);
  static const Color mindAro = Color(0xFFEDF67D);
  static const Color mintGreen = Color(0xFFD7FDEC);
  static const Color celticBlue = Color(0xFF226CE0);
  static const Color ashGrey = Color(0xFFB3BFB8);
  static const Color dark = Color(0xFF312F2F);
  static const Color black = Color(0xFF000103);

  static const mediumText = TextStyle(fontSize: 18);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyles.white,
    textTheme: GoogleFonts.montserratTextTheme().apply(
      bodyColor: AppStyles.black,
      displayColor: AppStyles.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppStyles.pantone2,
      selectedItemColor: AppStyles.mindAro,
      unselectedItemColor: AppStyles.pantone1,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyles.dark,
    textTheme: GoogleFonts.montserratTextTheme().apply(
      bodyColor: AppStyles.white,
      displayColor: AppStyles.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppStyles.black,
      selectedItemColor: AppStyles.mindAro,
      unselectedItemColor: AppStyles.white,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
}
