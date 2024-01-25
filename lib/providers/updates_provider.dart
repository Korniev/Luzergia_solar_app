import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class UpdateProvider extends ChangeNotifier {
  bool isInitialized = false;
  String? fcmToken;

  UpdateProvider();

  Future<void> init() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint(fcmToken);

    FirebaseMessaging.onMessage.listen((event) {
      debugPrint("Mensaje recibido");
      debugPrint("${event.data}");
      if (event.notification != null) {
        debugPrint("${event.notification!.title}");
      }
    });

    FirebaseMessaging.instance.subscribeToTopic('orderUpdates');
    debugPrint("Subscribed to 'orderUpdates' topic");
  }
}
