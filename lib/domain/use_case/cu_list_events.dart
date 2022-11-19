import 'package:festa/domain/exceptions/app_exception.dart';

import '../models/evento.dart';
import '../repositories/events_repository.dart';

class CuListEvents {
  final EventsRepository _eventsRepository;
  CuListEvents(this._eventsRepository);

  Future<List<Evento>> getAllEvents() async {
    try {
      List<Evento> events_list = await _eventsRepository.getEvents();
      if (events_list.isEmpty) {
        throw AppException(error_message: 'There are no events at this time.');
      }
      return events_list;
    } catch (e) {
      throw AppException(error_message: e.toString());
    }
  }
}
