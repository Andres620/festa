import 'package:mongo_dart/mongo_dart.dart';

import '../exceptions/app_exception.dart';
import '../models/evento.dart';
import '../repositories/events_repository.dart';

/// Control class that interacts with the event data
/// repository to apply business logic.
class CuListEvents {
  final EventsRepository _eventsRepository;
  CuListEvents(this._eventsRepository);

  /// Gets all events from a repository and returns them
  /// to be used as an object of type events.
  Future<List<Evento>> getAllEvents() async {
    try {
      List<Evento> eventsList = await _eventsRepository.getEvents();
      if (eventsList.isEmpty) {
        throw AppException(errorMessage: 'There are no events at this time.');
      }
      List<Evento> sortedByDate = eventsList.toList();
      sortedByDate.sort((a, b) => a.fecha.compareTo(b.fecha));

      return sortedByDate;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }

  //From a disco it gets all the events of that discotheque to be
  //able to order them by date and send them to the presentation layer.
  Future<List<Evento>> getEventsByDisco(ObjectId? discoId) async {
    try {
      List<Evento> eventsList =
          await _eventsRepository.getEventsByDisco(discoId);
      if (eventsList.isEmpty) {
        return eventsList;
      }
      List<Evento> sortedByDate = eventsList.toList();
      sortedByDate.sort((a, b) => a.fecha.compareTo(b.fecha));

      return sortedByDate;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
