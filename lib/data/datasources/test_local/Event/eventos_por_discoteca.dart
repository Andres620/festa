import '../../../../domain/models/evento.dart';
import '../../../../domain/repositories/eventos_por_discoteca_repository.dart';
import 'events_generator.dart';

/// Class that implements the events contract interacting with the fake db
/// This class filters the events created by the id of a disco.
class EventosPorDiscotecadbFake extends EventosPorDiscotecaRepository {
  EventosPorDiscotecadbFake({required super.idDiscoteca});

  @override
  Future<List<Evento>> getEventosPorDiscoteca() async {
    List<Evento> response = EventsGenerator(numberEvents: 3).createEvents();

    //An event can be assigned to a few clubs,so it is scrolledthrough
    //and the events is selected if the club id corresponds to the entered id.
    List<Evento> result = [
      for (var evento in response)
        for (var disco in evento.discoteca!)
          if (disco.id == idDiscoteca) evento
    ];

    return result;
  }
}
