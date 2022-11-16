import 'package:flutter_festa_proyect/domain/models/evento.dart';

abstract class EventsRepository{
  
  Future<List<Evento>> getEvents();
}