import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Data Graphs')),
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
