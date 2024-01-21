import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_header.dart';
import 'data_graphs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _selectedIndex = 3;
  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppStyles.ashGrey,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombre y Apellido',
                    labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    )),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Número de teléfono',
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    )),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Domicilio',
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    )),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                value: AdaptiveTheme.of(context).mode.isDark,
                onChanged: (bool value) {
                  if (value) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final contextCopy = context;
                  await FirebaseAuth.instance.signOut();

                  if (mounted) {
                    Navigator.of(contextCopy).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => SignInScreen(
                          headerBuilder: (context, constraints, _) {
                            return const CustomHeader();
                          },
                          providers: [EmailAuthProvider()],
                          actions: [
                            AuthStateChangeAction<SignedIn>((context, state) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DataGraphsScreen()));
                            }),
                            AuthStateChangeAction<UserCreated>(
                                (context, state) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DataGraphsScreen()));
                            }),
                          ],
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.pantone2,
                    foregroundColor: AppStyles.pantone1),
                child: const Text(
                  'Cerrar sesión',
                  style: AppStyles.mediumText,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _navigationService.navigateToScreen(index, context),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Update',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Help desk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
