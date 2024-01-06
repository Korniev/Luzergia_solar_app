import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luzergia_solar_app/screens/login.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luzergia solar app',
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppStyles.white,
              foregroundColor: AppStyles.white,
              elevation: 4),
          scaffoldBackgroundColor: AppStyles.white,
          textTheme: GoogleFonts.montserratTextTheme(),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppStyles.pantone2,
            selectedItemColor: AppStyles.celticBlue,
            unselectedItemColor: AppStyles.pantone1,
            showSelectedLabels: true,
            showUnselectedLabels: false,
          )),
      home: const LoginScreen(),
    );
  }
}
