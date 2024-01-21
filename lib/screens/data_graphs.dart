import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/widgets/arrow_painter.dart';
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

    final Size screenSize = MediaQuery.of(context).size;
    const double iconSize = 100.0;
    const double textHeight = 50.0;

    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    const Offset startArrow1 =
        Offset(50 + iconSize / 2, 40 + iconSize + textHeight);
    final Offset endArrow1 =
        Offset(screenWidth - 200 - iconSize / 2, 250 + iconSize / 2);
    final Offset cornerArrow1 = Offset(startArrow1.dx, endArrow1.dy);

    final Offset startArrow2 =
        Offset(screenWidth - 50 - iconSize / 2, 40 + iconSize + textHeight);
    final Offset endArrow2 =
        Offset(screenWidth - 100 - iconSize / 2, 250 + iconSize / 2);
    final Offset cornerArrow2 = Offset(startArrow2.dx, endArrow2.dy);

    final Offset startArrow3 =
        Offset(screenWidth - 150 - iconSize / 2, 250 + iconSize + textHeight);
    final Offset endArrow3 = Offset(
        screenWidth - 150 - iconSize / 2, screenHeight - 252 - iconSize / 2);

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
          Positioned.fill(
            child: CustomPaint(
              painter: ArrowPainter(
                start: startArrow1,
                end: endArrow1,
                corner: cornerArrow1,
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: ArrowPainter(
                start: startArrow2,
                end: endArrow2,
                corner: cornerArrow2,
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: ArrowPainter(start: startArrow3, end: endArrow3),
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
