import 'package:flutter/material.dart';

import '../../domain/use_case/cu_list_events.dart';

/// Class that manages dependency injection for events.
class EventProvider extends ChangeNotifier{
  final CuListEvents cuListEvents;
  EventProvider({required this.cuListEvents});
}