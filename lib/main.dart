import 'package:festa/app.dart';
import 'package:festa/services/local_notifications_service.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
<<<<<<< HEAD
  await promotionsdb.getPromociones(); //DELETE THIS
=======
>>>>>>> a9a602624b6f074617fb7861d187a9d095426589
  runApp(const Festa());
}
