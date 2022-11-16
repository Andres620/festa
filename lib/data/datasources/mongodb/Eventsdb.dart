import '../../../domain/models/evento.dart';
import '../../../domain/repositories/events_repository.dart';

class Eventsdb extends EventsRepository{

  @override
  Future<List<Evento>> getEvents() {
    // TODO: implement obtenerEventos
    throw UnimplementedError();
  }
}