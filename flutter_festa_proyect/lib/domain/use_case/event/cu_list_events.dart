import 'package:flutter_festa_proyect/domain/repositories/events_repository.dart';
import '../../models/evento.dart';

class CuListEvents {
  final EventsRepository _eventsRepository;

  CuListEvents(this._eventsRepository);

  Future<List<Evento>> getAllEvents() {
    return _eventsRepository.getEvents();
  }
}
