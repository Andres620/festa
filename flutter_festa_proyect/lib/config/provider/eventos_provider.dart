import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/domain/caso_uso/evento/cu_listar_eventos.dart';

class EventosProvider extends ChangeNotifier{

  final CuListarEventos cuListarEventos;

  EventosProvider({required this.cuListarEventos});
}