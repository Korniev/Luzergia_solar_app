import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/widgets/custom_appbar.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';

class DataGraphsScreen extends StatefulWidget {
  const DataGraphsScreen({Key? key}) : super(key: key);

  @override
  State<DataGraphsScreen> createState() => _DataGraphsScreenState();
}

class _DataGraphsScreenState extends State<DataGraphsScreen> {
  final int _selectedIndex = 0;
  final NavigationService _navigationService = NavigationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 120),
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
