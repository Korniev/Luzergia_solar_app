import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class UpdateProvider extends ChangeNotifier {
  bool isInitialized = false;
  String? fcmToken;

  UpdateProvider() {
    init();
  }

  Future<void> init() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint(fcmToken);
  }
}
