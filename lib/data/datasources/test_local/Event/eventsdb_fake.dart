import 'package:festa/data/datasources/test_local/Event/events_generator.dart';

import '../../../../domain/models/evento.dart';
import '../../../../domain/repositories/events_repository.dart';

/// Class that implements the evetns contract interacting with fake db 
class EventsdbFake extends EventsRepository {

  final int numberEvents;

  EventsdbFake(this.numberEvents);
  @override
  Future<List<Evento>> getEvents() async {
    List<Evento> response = EventsGenerator(numberEvents: numberEvents).createEvents();
    return response;
  }
  
  @override
  Future<Evento> getARandomEvent() {
    // TODO: implement getARandomEvent
    throw UnimplementedError();
  }
}
