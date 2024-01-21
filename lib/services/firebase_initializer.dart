import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInitializer {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> defaultEnergySets = [
    {
      'imported': '4.2 kWh',
      'produced': '0.3 kWh',
      'consumed': '4.5 kWh',
      'exported': '0.0 kWh',
    },
    {
      'imported': '3.8 kWh',
      'produced': '1.3 kWh',
      'consumed': '4.9 kWh',
      'exported': '0.2 kWh',
    },
    {
      'imported': '5.8 kWh',
      'produced': '2.1 kWh',
      'consumed': '4.9 kWh',
      'exported': '3.0 kWh',
    },
    {
      'imported': '2.1 kWh',
      'produced': '5.4 kWh',
      'consumed': '4.9 kWh',
      'exported': '2.6 kWh',
    },
    {
      'imported': '0.8 kWh',
      'produced': '3.7 kWh',
      'consumed': '2.5 kWh',
      'exported': '2.0 kWh',
    },
  ];

  Future<void> createRandomDefaultEnergyData() async {
    final today = DateTime.now();
    final startOfToday = DateTime(today.year, today.month, today.day);
    final endOfToday = DateTime(today.year, today.month, today.day + 1)
        .subtract(const Duration(seconds: 1));

    final todayQuery = await _db
        .collection('energyData')
        .where('dateTime',
            isGreaterThanOrEqualTo: Timestamp.fromDate(startOfToday))
        .where('dateTime', isLessThanOrEqualTo: Timestamp.fromDate(endOfToday))
        .get();

    if (todayQuery.docs.isEmpty) {
      final randomIndex = Random().nextInt(defaultEnergySets.length);
      final randomSet = defaultEnergySets[randomIndex];
      final newDocRef = _db.collection('energyData').doc();

      await newDocRef.set({
        ...randomSet,
        'dateTime': Timestamp.now(),
      });
    }
  }
}
