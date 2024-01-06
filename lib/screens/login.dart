import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';

import 'data_graphs.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('lib/images/LOGOTIPO LUZERGIA1.png',
                      width: 300.0, height: 300.0),
                  const SizedBox(height: 10.0),
                  Text(
                    'Log in',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Por favor, introduzca los datos para iniciar la sesión',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        labelStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        )),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, escribe su correo valido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        labelStyle: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyLarge?.color)),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, escribe su contraseña valida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DataGraphsScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyles.pantone2),
                    child: const Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
