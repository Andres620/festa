import 'package:festa/domain/exceptions/app_exception.dart';

import '../models/evento.dart';
import '../repositories/events_repository.dart';

class CuListEvents {
  final EventsRepository _eventsRepository;
  CuListEvents(this._eventsRepository);

  Future<List<Evento>> getAllEvents() async {
    try {
      List<Evento> eventsList = await _eventsRepository.getEvents();
      if (eventsList.isEmpty) {
        throw AppException(errorMessage: 'There are no events at this time.');
      }
      return eventsList;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
