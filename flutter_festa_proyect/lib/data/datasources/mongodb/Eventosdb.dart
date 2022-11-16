import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../domain/repositories/eventos_repository.dart';

class Eventosdb extends EventosRepository{

  @override
  Future<List<Evento>> obtenerEventos() {
    // TODO: implement obtenerEventos
    throw UnimplementedError();
  }
}