import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/domain/use_case/event/cu_list_events.dart';

class EventProvider extends ChangeNotifier{

  final CuListEvents cuListEvents;
  EventProvider({required this.cuListEvents});
}