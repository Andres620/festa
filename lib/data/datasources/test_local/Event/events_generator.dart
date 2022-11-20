import '../../../../domain/models/evento.dart';

/// Class works as a fake event repository.
class EventsGenerator {
  int numberEvents;

  EventsGenerator({required this.numberEvents});

  /// It is in charge of creating fake events to be used in crazy tests.
  /// Events are created with incremental information from zero to @numberEvents.
  List<Evento> createEvents() {
    List<Evento> newEvents = [];
    final now = DateTime.now();
    for (var i = 0; i < numberEvents; i++) {
      Evento newEvent = Evento(
          nombre: "Evento ${i.toString()}",
          descripcion: "Este es el evento ${i.toString()} ",
          tipo: "Concierto ${i.toString()}",
          fecha: now);

      newEvents.add(newEvent);
    }
    return newEvents;
  }
}
