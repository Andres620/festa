import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/Screens/list_events_screen.dart';

class LocalNotificationService {
  LocalNotificationService();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('festa_alien');

      final DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestCriticalPermission: true,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification; 
        );

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    }


  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    // display a dialog with the notification details, tap ok to go to another page
    print('id: $id');
  }


  void onDidReceiveNotificationResponse(String? payload) {
    print('payload: $payload');
  }

}
