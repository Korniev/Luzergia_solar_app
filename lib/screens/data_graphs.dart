import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/widgets/custom_appbar.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../providers/energy_provider.dart';
import '../widgets/energy_info.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EnergyInfo(
                    icon: Icons.flash_on,
                    label: 'Imported',
                    value: '$imported '),
                EnergyInfo(
                    icon: Icons.wb_sunny,
                    label: 'Produced',
                    value: '$produced '),
              ],
            ),
          ),
          CircleAvatar(
            radius: 48,
            backgroundColor: Colors.orange,
            child:
                Text('$consumed ', style: const TextStyle(color: Colors.white)),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EnergyInfo(
                    icon: Icons.home, label: 'Consumed', value: '$consumed '),
                EnergyInfo(
                    icon: Icons.flash_off,
                    label: 'Exported',
                    value: '$exported '),
              ],
            ),
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
