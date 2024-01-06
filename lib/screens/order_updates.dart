import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/services/navigation_service.dart';

class OrderUpdatesScreen extends StatefulWidget {
  const OrderUpdatesScreen({Key? key}) : super(key: key);

  @override
  State<OrderUpdatesScreen> createState() => _OrderUpdatesScreenState();
}

class _OrderUpdatesScreenState extends State<OrderUpdatesScreen> {
  final int _selectedIndex = 1;
  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Image.asset(
          'lib/images/LOGOTIPO_LUZERGIA_horizontal.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        children: [
          Text('Aquí tienes todas tus actualizaciones',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24.0),
          const UpdateTile(
            iconData: Icons.shopping_cart,
            title: 'Pedido realizado',
            isActive: true,
          ),
          const UpdateTile(
            iconData: Icons.mail,
            title: 'Correo de confirmación enviado',
            isActive: true,
          ),
          const UpdateTile(
            iconData: Icons.local_shipping,
            title: 'Pedido en camino',
            isActive: false,
          ),
          const UpdateTile(
            iconData: Icons.home,
            title: 'Pedido entregado',
            isActive: false,
          ),
        ],
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

class UpdateTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final bool isActive;

  const UpdateTile({
    Key? key,
    required this.iconData,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isActive ? Colors.green : Colors.grey,
        child: Icon(iconData, color: isActive ? Colors.white : Colors.black),
      ),
      title: Text(title),
      trailing: isActive ? const Icon(Icons.check, color: Colors.green) : null,
    );
  }
}
