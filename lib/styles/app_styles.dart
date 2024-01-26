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
          .bodySmall
          ?.copyWith(color: AppStyles.black),
      bodyMedium: GoogleFonts.montserratTextTheme()
          .bodySmall
          ?.copyWith(color: AppStyles.black),
      bodySmall: GoogleFonts.montserratTextTheme()
          .bodySmall
          ?.copyWith(color: AppStyles.black),
      titleLarge: GoogleFonts.montserratTextTheme()
          .titleLarge
          ?.copyWith(color: AppStyles.black),
      titleMedium: GoogleFonts.montserratTextTheme()
          .titleMedium
          ?.copyWith(color: AppStyles.black),
      titleSmall: GoogleFonts.montserratTextTheme()
          .titleSmall
          ?.copyWith(color: AppStyles.black),
      labelLarge: GoogleFonts.montserratTextTheme()
          .labelLarge
          ?.copyWith(color: AppStyles.black),
      labelMedium: GoogleFonts.montserratTextTheme()
          .labelMedium
          ?.copyWith(color: AppStyles.black),
      labelSmall: GoogleFonts.montserratTextTheme()
          .labelLarge
          ?.copyWith(color: AppStyles.black),
      displayLarge: GoogleFonts.montserratTextTheme()
          .displayLarge
          ?.copyWith(color: AppStyles.black),
      displayMedium: GoogleFonts.montserratTextTheme()
          .displayMedium
          ?.copyWith(color: AppStyles.black),
      displaySmall: GoogleFonts.montserratTextTheme()
          .displaySmall
          ?.copyWith(color: AppStyles.black),
      headlineLarge: GoogleFonts.montserratTextTheme()
          .headlineLarge
          ?.copyWith(color: AppStyles.black),
      headlineMedium: GoogleFonts.montserratTextTheme()
          .headlineMedium
          ?.copyWith(color: AppStyles.black),
      headlineSmall: GoogleFonts.montserratTextTheme()
          .headlineSmall
          ?.copyWith(color: AppStyles.black),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppStyles.pantone2,
      selectedItemColor: AppStyles.mindAro,
      unselectedItemColor: AppStyles.pantone1,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        appBarTheme: const AppBarTheme(color: AppStyles.dark),
        useMaterial3: true,
        scaffoldBackgroundColor: AppStyles.dark,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppStyles.pantone2,
              onPrimary: AppStyles.black,
            ),
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
