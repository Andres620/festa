import '../exceptions/app_exception.dart';
import '../models/evento.dart';
import '../repositories/eventos_por_discoteca_repository.dart';

/// Control class that interacts with the event data
/// repository to apply business logic.
class CuListarEventosPorDiscoteca {
  String idDiscoteca;

  CuListarEventosPorDiscoteca(this._eventsRepository,
      {required this.idDiscoteca});

  final EventosPorDiscotecaRepository _eventsRepository;

  Future<List<Evento>> getEventosPorDiscoteca() {
    try {
      return _eventsRepository.getEventosPorDiscoteca();
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
