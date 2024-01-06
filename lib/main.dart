import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luzergia_solar_app/screens/login.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
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
      ),
      dark: ThemeData(
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
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Luzergia solar app',
        theme: theme,
        darkTheme: darkTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
