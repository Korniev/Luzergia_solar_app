import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luzergia_solar_app/firebase_options.dart';
import 'package:luzergia_solar_app/providers/energy_provider.dart';
import 'package:luzergia_solar_app/providers/updates_provider.dart';
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
  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UpdateProvider(),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => EnergyProvider(),
        child: AdaptiveTheme(
          light: AppStyles.lightTheme,
          dark: AppStyles.darkTheme(context),
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (theme, darkTheme) => MaterialApp(
            title: 'Luzergia solar app',
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              FirebaseUILocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('es'),
              Locale('ca'),
            ],
            theme: theme,
            darkTheme: darkTheme,
            home: const Splash(),
          ),
        ),
      ),
    );
  }
}

Future<void> backgroundMessageHandler(RemoteMessage remoteMessage) async {
  await Firebase.initializeApp();
  debugPrint("Background message received: ${remoteMessage.messageId}");
  if (remoteMessage.notification != null) {
    debugPrint("Background notification: ${remoteMessage.notification!.title}");
  }
}
