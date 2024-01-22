import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';
import 'package:luzergia_solar_app/widgets/custom_appbar.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';

class HelpDeskScreen extends StatefulWidget {
  const HelpDeskScreen({super.key});

  @override
  State<HelpDeskScreen> createState() => _HelpDeskScreenState();
}

class _HelpDeskScreenState extends State<HelpDeskScreen> {
  final int _selectedIndex = 2;
  final NavigationService _navigationService = NavigationService();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  void sendSupportRequest() async {
    final String name = nameController.text;
    final String phone = phoneController.text;
    final String problem = problemController.text;

    if (name.isEmpty || phone.isEmpty || problem.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Todos los campos son necesarios para rellenar')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('email').add({
        'to': 'Jman-sorokolet@ukr.net',
        'message': {
          'subject': 'New Support Request',
          'html': 'Name: $name<br>Phone: $phone<br>Problem: $problem',
        },
      });
      if (!mounted) return;

      nameController.clear();
      phoneController.clear();
      problemController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Solicitud de asistencia enviada correctamente')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('No se ha podido enviar la solicitud de asistencia: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre y Apellido',
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  border: const OutlineInputBorder(),
                ),
                controller: nameController,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Número de teléfono',
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Cuéntanos tu problema',
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  border: const OutlineInputBorder(),
                ),
                maxLines: 5,
                controller: problemController,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          nameController.clear();
                          phoneController.clear();
                          problemController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyles.pantone2,
                            foregroundColor: AppStyles.pantone1),
                        child: Text('Borrar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith())),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: sendSupportRequest,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyles.pantone2,
                            foregroundColor: AppStyles.pantone1),
                        child: Text('Enviar',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith())),
                  ),
                ],
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
