import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import '../data/datasources/mongodb/credentials.dart';
import '../data/datasources/mongodb/events_mongodb.dart';
import '../domain/models/evento.dart';

// Instance of the plugin class
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

///initializes the notification service with the necessary 
///configurations and plugins for android and for iOS
Future<void> initialize() async {
  tz.initializeTimeZones();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('festa_alien');

  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestCriticalPermission: true,
          onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  showIntervbalNotificationPayload();
}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      onNotificationClick.add(payload);
    }
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  // display a dialog with the notification details, tap ok to go to another page
}

/// Contains notification details specific to each platform.
Future<NotificationDetails> _notificationDetails() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('channel_id', 'channel_name',
          channelDescription: 'description',
          importance: Importance.max,
          priority: Priority.max,
          playSound: true);

  const DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails();

  return const NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
  );
}

/// It is used to display a notification only once.
/// It is used when a new event is added to the database for immediate notification. 
Future<void> showNotification(
    // {required int id,
    // required String title,
    // required String body,
    // required int seconds}
) async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.show(
      1, 'Titulo de notificacion', 'hola de saludo.', notificationDetails);
}

/// It is used to display a notification on a specific date..
Future<void> showScheduledNotification() async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.zonedSchedule(
    1,
    'Titulo de notificacion',
    'hola de saludo.',
    tz.TZDateTime.from(
      DateTime.now().add(const Duration(seconds: 4)),
      tz.local,
    ),
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}

/// It periodically displays notifications but it is not possible
/// to interact with them since they do not handle a payload.
Future<void> showIntervbalNotification() async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Titulo de notificacion',
      'hola de saludo.',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidAllowWhileIdle: true);
}


/// It periodically displays notifications that can be interacted with because they have a payload.
/// They are used to notify and open the event view.
Future<void> showIntervbalNotificationPayload() async {
  final notificationDetails = await _notificationDetails();
  var eventsdb = EventsMongodb(connectionString: MONGO_URL, collection: COLLECTION_EVENTS);
  var event = await eventsdb.getARandomEvent();
  var payload = eventoToJson(event);
  await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      event.nombre,
      event.descripcion,
      payload: payload,
      RepeatInterval.everyMinute,
      notificationDetails,
      androidAllowWhileIdle: true);
}


