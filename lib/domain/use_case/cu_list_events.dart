import '../models/evento.dart';
import '../repositories/events_repository.dart';

class CuListEvents {
  final EventsRepository _eventsRepository;

  CuListEvents(this._eventsRepository);

  Future<List<Evento>> getAllEvents() {
    return _eventsRepository.getEvents();
  }
}
