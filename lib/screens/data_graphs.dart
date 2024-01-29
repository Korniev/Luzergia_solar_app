import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
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
        ? energyData.energyTotal.last.imported
        : '0.0';
    final produced = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.last.produced
        : '0.0';
    final consumed = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.last.consumed
        : '0.0';
    final exported = energyData.energyTotal.isNotEmpty
        ? energyData.energyTotal.last.exported
        : '0.0';
    String dateTimeDisplay = "";
    if (energyData.energyTotal.isNotEmpty) {
      DateTime dateTime = energyData.energyTotal.last.dateTime;
      dateTimeDisplay = DateFormat('dd-MM-yyyy – kk:mm').format(dateTime);
    }

    final Size screenSize = MediaQuery.of(context).size;
    const double textHeight = 50.0;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    final double iconSize = screenWidth * 0.2;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Offset startArrow1 =
              Offset(screenWidth * 0.23, textHeight + iconSize + 10);
          final Offset endArrow1 =
              Offset(screenWidth * 0.38, screenHeight * 0.33);
          final Offset cornerArrow1 = Offset(startArrow1.dx, endArrow1.dy);

          final Offset startArrow2 =
              Offset(screenWidth * 0.77, textHeight + iconSize + 10);
          final Offset endArrow2 =
              Offset(screenWidth * 0.65, screenHeight * 0.33);
          final Offset cornerArrow2 = Offset(startArrow2.dx, endArrow2.dy);

          final Offset startArrow3 =
              Offset(screenWidth * 0.51, screenHeight * 0.43);
          final Offset endArrow3 =
              Offset(screenWidth * 0.51, screenHeight * 0.6);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    dateTimeDisplay,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 15,
                      left: screenWidth * 0.1,
                      child: Column(
                        children: [
                          Image.asset('lib/images/icono_luzergia_red.png',
                              width: iconSize, height: iconSize),
                          Text(
                              '${AppLocalizations.of(context)!.importado}\n  $imported ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith()),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: screenWidth * 0.1,
                      child: Column(
                        children: [
                          Image.asset('lib/images/icono_luzergia_sol.png',
                              width: iconSize, height: iconSize),
                          Text(
                              '${AppLocalizations.of(context)!.producido}\n  $produced ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith()),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 230,
                      right: screenWidth * 0.37,
                      child: Column(
                        children: [
                          Image.asset('lib/images/icono_luzergia_home.png',
                              width: iconSize, height: iconSize),
                          Text(
                              '${AppLocalizations.of(context)!.consumido}\n   $consumed ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith()),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: screenWidth * 0.39,
                      child: Column(
                        children: [
                          Image.asset('lib/images/icono_luzergia_red.png',
                              width: iconSize, height: iconSize),
                          Text(
                              '${AppLocalizations.of(context)!.exportado}\n $exported ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith()),
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
                        painter:
                            ArrowPainter(start: startArrow3, end: endArrow3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
