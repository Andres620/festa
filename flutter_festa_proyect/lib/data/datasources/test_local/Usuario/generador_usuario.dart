import 'package:flutter_festa_proyect/domain/models/usuario.dart';

class GeneradorUsuario {
  int cantidad_usuarios;

  GeneradorUsuario({required this.cantidad_usuarios});

  List<Usuario> crearFiesteros() {
    List<Usuario> nuevos_fiesteros = [];
    for (var i = 0; i < this.cantidad_usuarios; i++) {
      Usuario nuevo_fiestero = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Fiestero ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Fiestero${i.toString()}@gmail.com',
          tipo: "Fiestero",
          nivel: GeneradorNivel.crearNivel());

      nuevos_fiesteros.add(nuevo_fiestero);
    }
    return nuevos_fiesteros;
  }

  List<Usuario> crearDuenosDiscoteca() {
    List<Usuario> nuevos_duenos = [];
    for (var i = 0; i < this.cantidad_usuarios; i++) {
      Usuario nuevo_dueno = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Dueño ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Dueño${i.toString()}@gmail.com',
          tipo: "Dueño de discoteca");

      nuevos_duenos.add(nuevo_dueno);
    }
    return nuevos_duenos;
  }

  List<Usuario> crearOrganizadores() {
    List<Usuario> nuevos_organizadores = [];
    for (var i = 0; i < this.cantidad_usuarios; i++) {
      Usuario nuevo_organizador = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Organizador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Organizador${i.toString()}@gmail.com',
          tipo: "Organizador de eventos");

      nuevos_organizadores.add(nuevo_organizador);
    }
    return nuevos_organizadores;
  }

  List<Usuario> crearAdministradores() {
    List<Usuario> nuevos_administradores = [];
    for (var i = 0; i < this.cantidad_usuarios; i++) {
      Usuario nuevo_administrador = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Administrador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Admin${i.toString()}@gmail.com',
          tipo: "Admin");

      nuevos_administradores.add(nuevo_administrador);
    }
    return nuevos_administradores;
  }
}

class GeneradorNivel {
  static Nivel crearNivel() {
    return Nivel(nombre: "Alien", numeroNivel: 4, puntos: 300);
  }
}
