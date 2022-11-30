import '../models/evento.dart';

/// Contract that must be implemented for an event repository to 
/// interact with the application. 
abstract class EventsRepository{

  /// Gets the events that are hosted in the data repository 
  ///   to obtain them so that they can be manipulated as event type objects.
  Future<List<Evento>> getEvents();
  Future<Evento> getARandomEvent();
}