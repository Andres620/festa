import 'package:flutter_festa_proyect/data/datasources/test_local/Eventos/generador_eventos.dart';
import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../../domain/repositories/eventos_repository.dart';

class EventosdbFake extends EventosRepository {
  @override
  Future<List<Evento>> obtenerEventos() async {
    List<Evento> response = GeneradorEventos(cantidadEventos: 3).crearEventos();

    return response;
  }
}
