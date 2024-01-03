import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          // Wrap with SingleChildScrollView
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Placeholder for the logo
                  Image.asset('lib/images/LOGOTIPO_LUZERGIA.jpg',
                      width: 300.0, height: 300.0),
                  const SizedBox(
                      height: 10.0), // Spacing between logo and title
                  Text(
                    'Log in',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                      height: 8.0), // Spacing between title and subtitle
                  Text(
                    'Por favor, introduzca los datos para iniciar la sesión',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                      height: 30.0), // Spacing before the text fields
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, escribe su correo valido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0), // Spacing between text fields
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, escribe su contraseña valida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                      height: 30.0), // Spacing before the login button
                  ElevatedButton(
                    onPressed: () {
                      // Implement login logic
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
