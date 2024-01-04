import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luzergia_solar_app/screens/login.dart';

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
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color(0xFF16375B),
                secondary: const Color(0xFF4CBAB2),
                tertiary: const Color(0xFF444D57),
              ),
          textTheme: GoogleFonts.montserratTextTheme(),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Colors.white,
              elevation: 4)),
      home: const LoginScreen(),
    );
  }
}
