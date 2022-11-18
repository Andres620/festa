import 'package:festa/data/datasources/test_local/Event/events_generator.dart';

import '../../../../domain/models/evento.dart';
import '../../../../domain/repositories/eventos_por_discoteca_repository.dart';

class EventosPorDiscotecadbFake extends EventosPorDiscotecaRepository {
  EventosPorDiscotecadbFake({required super.idDiscoteca});

  @override
  Future<List<Evento>> getEventosPorDiscoteca() async {
    //_AnimatedMovies = AllMovies.where((i) => i.isAnimated).toList();

    List<Evento> response = EventsGenerator(number_events: 3).createEvents();

    List<Evento> result = [
      for (var evento in response)
        for (var disco in evento.discoteca!)
          if (disco.id == idDiscoteca) evento
    ];

    return result;
  }
}
