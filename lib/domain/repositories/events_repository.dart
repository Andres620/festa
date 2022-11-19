import '../models/evento.dart';

abstract class EventsRepository{
  Future<List<Evento>> getEvents();
  Future<Evento> getARandomEvent();
}