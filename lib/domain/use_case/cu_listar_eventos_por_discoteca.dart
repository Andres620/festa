import '../models/evento.dart';
import '../repositories/eventos_por_discoteca_repository.dart';

class CuListarEventosPorDiscoteca {
  String idDiscoteca;

  CuListarEventosPorDiscoteca(this._eventsRepository,
      {required this.idDiscoteca});

  final EventosPorDiscotecaRepository _eventsRepository;

  Future<List<Evento>> getEventosPorDiscoteca() {
    return _eventsRepository.getEventosPorDiscoteca();
  }
}
