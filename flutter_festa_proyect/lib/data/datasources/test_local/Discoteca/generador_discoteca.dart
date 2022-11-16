import 'package:flutter_festa_proyect/data/datasources/test_local/Usuario/generador_usuario.dart';
import 'package:flutter_festa_proyect/domain/models/discoteca.dart';
import 'package:flutter_festa_proyect/domain/models/usuario.dart';

class GeneradorDiscotecas {
  int cantidad_discotecas;

  GeneradorDiscotecas({required this.cantidad_discotecas});

  List<Discoteca> crearDiscotecas() {
    List<Discoteca> nuevasDiscotecas = [];
    for (var i = 0; i < this.cantidad_discotecas; i++) {
      Discoteca nueva_disco = Discoteca(
        id: i.toString(),
        nombre: 'Disco ${i.toString()}',
        tipo: 'Discoteca',
        hora: '3:00 a.m',
        duenoDiscoteca: _crearUsuario(),
      );
    }
    return nuevasDiscotecas;
  }

  Usuario _crearUsuario (){
    return GeneradorUsuario(cantidad_usuarios: 1).crearDuenosDiscoteca()[0];
  }
}
