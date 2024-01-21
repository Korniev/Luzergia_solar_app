import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/widgets/custom_appbar.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../providers/energy_provider.dart';

class DataGraphsScreen extends StatefulWidget {
  const DataGraphsScreen({super.key});

  @override
  State<DataGraphsScreen> createState() => _DataGraphsScreenState();
}

class _DataGraphsScreenState extends State<DataGraphsScreen> {
  final int _selectedIndex = 0;
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<EnergyProvider>(context, listen: false).loadEnergyData());
  }

  @override
  Widget build(BuildContext context) {
    final energyData = Provider.of<EnergyProvider>(context);
    final imported = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.first.imported
        : '0.0';
    final produced = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.first.produced
        : '0.0';
    final consumed = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.first.consumed
        : '0.0';
    final exported = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.first.exported
        : '0.0';

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            left: 50,
            child: Column(
              children: [
                Image.asset('lib/images/icono_luzergia_red.png',
                    width: 100.0, height: 100.0),
                Text('Importado:\n   $imported ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 50,
            child: Column(
              children: [
                Image.asset('lib/images/icono_luzergia_sol.png',
                    width: 100.0, height: 100.0),
                Text('Producido:\n   $produced ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
              ],
            ),
          ),
          Positioned(
            top: 250,
            right: 150,
            child: Column(
              children: [
                Image.asset('lib/images/icono_luzergia_home.png',
                    width: 100.0, height: 100.0),
                Text('Consumido:\n    $consumed ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 150,
            child: Column(
              children: [
                Image.asset('lib/images/icono_luzergia_red.png',
                    width: 100.0, height: 100.0),
                Text('Exportado:\n   $exported ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
              ],
            ),
          ),
          // Тут додайте інші `Positioned` віджети для розміщення інших елементів
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
