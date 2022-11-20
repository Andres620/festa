import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes the notification service
  await initialize();
  runApp(const Festa());
}
