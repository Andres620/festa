import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
import 'package:flutter/material.dart';

import 'data/datasources/mongodb/events_mongodb.dart';
import 'data/datasources/mongodb/promotions_mongodb.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const Festa());
}
