import 'package:flutter_festa_proyect/data/datasources/test_local/Event/events_generator.dart';
import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../domain/repositories/events_repository.dart';

class EventsdbFake extends EventsRepository {
  @override
  Future<List<Evento>> getEvents() async {
    List<Evento> response = EventsGenerator(number_events: 3).createEvents();

    return response;
  }
}
