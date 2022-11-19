import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
import 'package:flutter/material.dart';

import 'data/datasources/mongodb/Promotionsdb.dart';

void main() async{
  var promotionsdb = Promotionsdb();
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  await promotionsdb.getPromociones(); //DELETE THIS
  runApp(const Festa());
}
