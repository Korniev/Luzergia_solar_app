import 'package:flutter/material.dart';

import 'data_graphs.dart';
import 'help_desk.dart';
import 'order_updates.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre y Apellido'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Correo electrónico'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Número de teléfono'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Domicilio'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logout functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the background color
              ),
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DataGraphsScreen()));
          }
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrderUpdatesScreen()));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpDeskScreen()));
          }
        },
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
