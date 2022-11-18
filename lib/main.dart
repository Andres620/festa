import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
import 'package:flutter/material.dart';



void main() async{
  var promotionsdb = Promotionsdb();
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const Festa());
}
