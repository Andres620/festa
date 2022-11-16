import 'package:flutter_festa_proyect/domain/models/evento.dart';

abstract class EventosRepository{
  
  Future<List<Evento>> obtenerEventos();
}