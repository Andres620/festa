import 'package:flutter_festa_proyect/domain/repositories/eventos_repository.dart';
import '../../models/evento.dart';

class CuListarEventos{
  final EventosRepository _eventosRepository;

  CuListarEventos(this._eventosRepository);

  Future<List<Evento>> obtenerTodosEventos(){
    return _eventosRepository.obtenerEventos();
  }


}