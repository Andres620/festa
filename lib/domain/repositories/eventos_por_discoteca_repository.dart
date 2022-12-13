import '../models/evento.dart';

/// Contract that must be implemented for an event repository to
/// interact with the application.
abstract class EventosPorDiscotecaRepository {
  ///The id of the disco with which the information is to be leaked.
  String idDiscoteca;

  ///Ask for the id with which the information is to be filtered
  EventosPorDiscotecaRepository({required this.idDiscoteca});

  /// Gets the events that are hosted in the data repository
  /// to obtain them so that they can be manipulated as event type objects.
  Future<List<Evento>> getEventosPorDiscoteca();
}
