import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/services/notification_services.dart';

import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  runApp(const Festa());
}
