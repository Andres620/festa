import 'package:flutter_festa_proyect/data/datasources/test_local/Discoteca/generador_discoteca.dart';
import 'package:flutter_festa_proyect/domain/models/discoteca.dart';
import 'package:flutter_festa_proyect/domain/models/evento.dart';

import '../../../../domain/models/usuario.dart';
import '../Usuario/generador_usuario.dart';

class GeneradorEventos {
  int cantidadEventos;

  GeneradorEventos({required this.cantidadEventos});

  List<Evento> crearEventos() {
    List<Evento> nuevos_eventos = [];
    final now = DateTime.now();
    for (var i = 0; i < this.cantidadEventos; i++) {
      Evento nuevo_evento = Evento(
          id: i.toString(),
          nombre: "Evento ${i.toString()}",
          descripcion: "Este es el evento ${i.toString()} ",
          tipo: "Concierto ${i.toString()}",
          fecha: now,
          organizadorEventos: _crearOrganizador(),
          discoteca: _crearDiscotecas());

      nuevos_eventos.add(nuevo_evento);
    }
    return nuevos_eventos;
  }

  Usuario _crearOrganizador (){
    return GeneradorUsuario(cantidad_usuarios: 1).crearOrganizadores()[0];
  }

  List<Discoteca> _crearDiscotecas(){
    return GeneradorDiscotecas(cantidad_discotecas: 1).crearDiscotecas();
  }
}
