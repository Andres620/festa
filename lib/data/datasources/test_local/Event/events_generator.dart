import '../../../../domain/models/evento.dart';

class EventsGenerator {
  int numberEvents;

  EventsGenerator({required this.numberEvents});

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
