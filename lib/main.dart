import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
// import 'package:festa/services/notification_services.dart';
import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const Festa());
}
