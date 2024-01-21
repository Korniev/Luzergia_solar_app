import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/firebase_options.dart';
import 'package:luzergia_solar_app/providers/energy_provider.dart';
import 'package:luzergia_solar_app/screens/splash.dart';
import 'package:luzergia_solar_app/services/firebase_initializer.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseInitializer = FirebaseInitializer();
  await firebaseInitializer.createRandomDefaultEnergyData();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => EnergyProvider(),
      child: AdaptiveTheme(
        light: AppStyles.lightTheme,
        dark: AppStyles.darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Luzergia solar app',
          theme: theme,
          darkTheme: darkTheme,
          home: const Splash(),
        ),
      ),
    );
  }
}
