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

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppStyles.white,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyles.white,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
        bodyLarge: GoogleFonts.montserratTextTheme()
            .bodyLarge
            ?.copyWith(color: Colors.white),
        bodyMedium: GoogleFonts.montserratTextTheme()
            .bodyMedium
            ?.copyWith(color: Colors.white),
        bodySmall: GoogleFonts.montserratTextTheme()
            .bodySmall
            ?.copyWith(color: Colors.white)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppStyles.pantone2,
      selectedItemColor: AppStyles.mindAro,
      unselectedItemColor: AppStyles.pantone1,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: AppStyles.dark),
    useMaterial3: true,
    scaffoldBackgroundColor: AppStyles.dark,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      bodyLarge: GoogleFonts.montserratTextTheme()
          .bodySmall
          ?.copyWith(color: Colors.white),
      bodyMedium: GoogleFonts.montserratTextTheme()
          .bodySmall
          ?.copyWith(color: Colors.white),
      bodySmall: GoogleFonts.montserratTextTheme()
          .bodySmall
          ?.copyWith(color: Colors.white),
      titleLarge: GoogleFonts.montserratTextTheme()
          .titleLarge
          ?.copyWith(color: Colors.white),
      titleMedium: GoogleFonts.montserratTextTheme()
          .titleMedium
          ?.copyWith(color: Colors.white),
      titleSmall: GoogleFonts.montserratTextTheme()
          .titleSmall
          ?.copyWith(color: Colors.white),
      labelLarge: GoogleFonts.montserratTextTheme()
          .labelLarge
          ?.copyWith(color: Colors.white),
      labelMedium: GoogleFonts.montserratTextTheme()
          .labelMedium
          ?.copyWith(color: Colors.white),
      labelSmall: GoogleFonts.montserratTextTheme()
          .labelLarge
          ?.copyWith(color: Colors.white),
      displayLarge: GoogleFonts.montserratTextTheme()
          .displayLarge
          ?.copyWith(color: Colors.white),
      displayMedium: GoogleFonts.montserratTextTheme()
          .displayMedium
          ?.copyWith(color: Colors.white),
      displaySmall: GoogleFonts.montserratTextTheme()
          .displaySmall
          ?.copyWith(color: Colors.white),
      headlineLarge: GoogleFonts.montserratTextTheme()
          .headlineLarge
          ?.copyWith(color: Colors.white),
      headlineMedium: GoogleFonts.montserratTextTheme()
          .headlineMedium
          ?.copyWith(color: Colors.white),
      headlineSmall: GoogleFonts.montserratTextTheme()
          .headlineSmall
          ?.copyWith(color: Colors.white),
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
