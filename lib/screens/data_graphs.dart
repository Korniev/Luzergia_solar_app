import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/screens/help_desk.dart';
import 'package:luzergia_solar_app/screens/profile.dart';

import 'order_updates.dart';

class DataGraphsScreen extends StatelessWidget {
  const DataGraphsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example data for the charts
    final productionData = [
      BarChartGroupData(
          x: 0, barRods: [BarChartRodData(toY: 100, color: Colors.green)]),
      BarChartGroupData(
          x: 1, barRods: [BarChartRodData(toY: 75, color: Colors.green)]),
      // ... more production data
    ];

    final consumptionData = [
      BarChartGroupData(
          x: 0, barRods: [BarChartRodData(toY: 70, color: Colors.red)]),
      BarChartGroupData(
          x: 1, barRods: [BarChartRodData(toY: 100, color: Colors.red)]),
      // ... more consumption data
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Customize color as needed
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        flexibleSpace: Image.asset(
          'lib/images/LOGOTIPO_LUZERGIA_horizontal.jpg',
          fit: BoxFit.cover, // Cover the entire AppBar area
          height: double.infinity,
          width: double.infinity,
        ),
      ),
      body: Column(
        children: <Widget>[
          const Text('Producción y Consumición'),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups:
                    productionData, // Use productionData for production chart
                // Add more chart styling and properties
              ),
            ),
          ),
          // Add another BarChart widget for consumption data if needed
          // Other widgets like indicator segment can be added here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OrderUpdatesScreen()));
          }
          if (index == 2) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HelpDeskScreen()));
          }
          if (index == 3) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
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

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
