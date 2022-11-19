import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

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
  showIntervbalNotification();
}

void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      onNotificationClick.add(payload);
    }
}

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

Future<void> showNotification(
    // {
    // required int id,
    // required String title,
    // required String body,}
    ) async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.show(
      1, 'Titulo de notificacion', 'hola de saludo.', notificationDetails);
}

Future<void> showScheduledNotification(
    // {required int id,
    // required String title,
    // required String body,
    // required int seconds}
    ) async {
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

Future<void> showIntervbalNotification(
    // {required int id,
    // required String title,
    // required String body,
    // required int seconds}
    ) async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Titulo de notificacion',
      'hola de saludo.',
      RepeatInterval.everyMinute,
      notificationDetails,
      androidAllowWhileIdle: true);
}

Future<void> showIntervbalNotificationPayload(
    // {required int id,
    // required String title,
    // required String body,
    // required int seconds}
    {required String payload}
    ) async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      'Titulo de notificacion',
      'hola de saludo.',
      payload: payload,
      RepeatInterval.everyMinute,
      notificationDetails,
      androidAllowWhileIdle: true);
}

Future<void> showNotificationWithPayload(
    // {required int id,
    // required String title,
    // required String body,
    // required String payload}
    {required String payload}) async {
  final notificationDetails = await _notificationDetails();
  await flutterLocalNotificationsPlugin.show(
      1, 'Titulo de notificacion', 'hola de saludo.', notificationDetails,
      payload: payload);
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {
  // display a dialog with the notification details, tap ok to go to another page
}
