import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/energy.dart';

class EnergyProvider extends ChangeNotifier {
  List<Energy> energyTotal = [];
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> loadEnergyData() async {
    try {
      final snapshot = await db.collection('energyData').get();
      final documents = snapshot.docs;
      final List<Energy> loadedData =
          documents.map((doc) => Energy.fromFirestore(doc)).toList();

      energyTotal = loadedData;
      notifyListeners();
    } catch (error) {
      debugPrint('$error');
    }
  }
}
