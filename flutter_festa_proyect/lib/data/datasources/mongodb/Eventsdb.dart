import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:mongo_dart/mongo_dart.dart';  

import '../../../domain/repositories/events_repository.dart';

class Eventsdb extends EventsRepository{

  @override
  Future<List<Evento>> getEvents() {
    // TODO: implement obtenerEventos
    throw UnimplementedError();
  }
}