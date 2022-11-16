
import '../../../../domain/models/discoteca.dart';
import '../../../../domain/models/evento.dart';
import '../../../../domain/models/usuario.dart';
import '../Club/club_generator.dart';
import '../User/user_generator.dart';

class EventsGenerator {
  int number_events;

  EventsGenerator({required this.number_events});

  List<Evento> createEvents() {
    List<Evento> new_events = [];
    final now = DateTime.now();
    for (var i = 0; i < this.number_events; i++) {
      Evento new_event = Evento(
          id: i.toString(),
          nombre: "Evento ${i.toString()}",
          descripcion: "Este es el evento ${i.toString()} ",
          tipo: "Concierto ${i.toString()}",
          fecha: now,
          organizadorEventos: _createOrganizer(),
          discoteca: _createClubs());

      new_events.add(new_event);
    }
    return new_events;
  }

  Usuario _createOrganizer (){
    return UserGenerator(number_users: 1).createOrganizer()[0];
  }

  List<Discoteca> _createClubs(){
    return ClubGenerator(number_clubs: 1).createClubs();
  }
}
