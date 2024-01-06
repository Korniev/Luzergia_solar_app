import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/screens/data_graphs.dart';
import 'package:luzergia_solar_app/screens/help_desk.dart';
import 'package:luzergia_solar_app/screens/order_updates.dart';
import 'package:luzergia_solar_app/screens/profile.dart';

class NavigationService {
  void navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DataGraphsScreen()));
        break;
      case 1:
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const OrderUpdatesScreen()));
        break;
      case 2:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HelpDeskScreen()));
        break;
      case 3:
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
        break;
    }
  }
}
