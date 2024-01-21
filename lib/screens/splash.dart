import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/screens/data_graphs.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

import '../widgets/custom_header.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String status = "Inicializando la aplicación...";

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme =
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/logotipo_alterna.png',
                width: 400.0, height: 400.0),
            const SizedBox(height: 2, width: 2),
            Text(
              status,
              style: TextStyle(
                  color: isDarkTheme ? AppStyles.white : AppStyles.black),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        status = "Cargando 25%";
      });
    }
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        status = "Cargando 50%";
      });
    }

    if (FirebaseAuth.instance.currentUser == null) {
      final providers = [EmailAuthProvider()];
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(
              headerBuilder: (context, constraints, _) {
                return const CustomHeader();
              },
              providers: providers,
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataGraphsScreen()));
                }),
                AuthStateChangeAction<UserCreated>((context, state) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataGraphsScreen()));
                }),
              ],
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DataGraphsScreen()));
      }
    }

    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      setState(() {
        status = "Cargando 100%";
      });
    }
  }
}
