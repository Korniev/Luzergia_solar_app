import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/LOGOTIPO LUZERGIA1.png',
                width: 300.0, height: 300.0),
            const SizedBox(height: 2, width: 2),
            Text(status, style: AppStyles.mediumText),
          ],
        ),
      ),
    );
  }

  Future<void> init() async {
    await Future.delayed(const Duration(microseconds: 500));
    status = "Cargando 50%";
    setState(() {});
    await Future.delayed(const Duration(microseconds: 500));
    status = "Cargando 100%";
    setState(() {});
  }
}
