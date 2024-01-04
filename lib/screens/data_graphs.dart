import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DataGraphsScreen extends StatelessWidget {
  const DataGraphsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example data for the charts
    final productionData = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    final consumptionData = [
      LinearSales(0, 70),
      LinearSales(1, 100),
      LinearSales(2, 50),
      LinearSales(3, 20),
    ];

    var series = [
      charts.Series(
        id: 'Production',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: productionData,
      ),
      charts.Series(
        id: 'Consumption',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: consumptionData,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Graphs'),
      ),
      body: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Producción'),
              Text('Consumición'),
            ],
          ),
          chartWidget, // Your chart widget here
          // Other widgets like indicator segment can be added here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Data',
          ),
          // Other bottom navigation bar items...
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
