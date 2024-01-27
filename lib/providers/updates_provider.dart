import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class UpdateProvider extends ChangeNotifier {
  bool isInitialized = false;
  String? fcmToken;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  UpdateProvider() {
    _initNotifications();
  }

  Future<void> _initNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher_foreground');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> init() async {
    fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint(fcmToken);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("Mensaje recibido");
      debugPrint("${message.data}");
      if (message.notification != null) {
        debugPrint("${message.notification!.title}");
        _showNotification(
            message.notification!.title, message.notification!.body);
      }
    });

    FirebaseMessaging.instance.subscribeToTopic('orderUpdates');
    debugPrint("Esta escrito a 'orderUpdates' topic");
  }

  Future<void> _showNotification(String? title, String? body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'order_updates_channel', 'Order Updates',
        importance: Importance.max, priority: Priority.high, showWhen: false);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }
}
