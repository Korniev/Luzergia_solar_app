import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luzergia_solar_app/widgets/custom_appbar.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';
import 'package:luzergia_solar_app/widgets/pie_chart.dart';

import '../services/get_access_token.dart';

class DataGraphsScreen extends StatefulWidget {
  const DataGraphsScreen({Key? key}) : super(key: key);

  @override
  State<DataGraphsScreen> createState() => _DataGraphsScreenState();
}

class _DataGraphsScreenState extends State<DataGraphsScreen> {
  final int _selectedIndex = 0;
  final NavigationService _navigationService = NavigationService();

  Future<dynamic> fetchData() async {
    var apiUrl =
        'https://api.enphaseenergy.com/api/v2/systems/123/energy_lifetime';
    var accessToken = await getAccessToken();

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      debugPrint("Error request: ${response.statusCode}");
      throw Exception('Error request: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  var data = snapshot.data as List<dynamic>;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index]['title']),
                      );
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 120),
            const PieChartSample2(),
          ],
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
