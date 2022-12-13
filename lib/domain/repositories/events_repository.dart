import 'package:mongo_dart/mongo_dart.dart';

import '../models/evento.dart';

/// Contract that must be implemented for an event repository to
/// interact with the application.
abstract class EventsRepository {
  /// Gets the events that are hosted in the data repository
  /// to obtain them so that they can be manipulated as event type objects.
  Future<List<Evento>> getEvents();

  // Signature of a method to obtain a random event from a data repository.
  Future<Evento> getARandomEvent();

  // Signature of a method to obtain the events that a discotheque has
  //along its existence.
  Future<List<Evento>> getEventsByDisco(ObjectId? discoId);
}
