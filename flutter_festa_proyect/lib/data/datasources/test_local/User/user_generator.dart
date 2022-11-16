import 'package:flutter_festa_proyect/domain/models/usuario.dart';

class UserGenerator {
  int number_users;

  UserGenerator({required this.number_users});

  List<Usuario> createFiesteros() {
    List<Usuario> new_fiesteros = [];
    for (var i = 0; i < this.number_users; i++) {
      Usuario new_fiestero = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Fiestero ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Fiestero${i.toString()}@gmail.com',
          tipo: "Fiestero",
          nivel: LevelGenerator.createLevel());

      new_fiesteros.add(new_fiestero);
    }
    return new_fiesteros;
  }

  List<Usuario> createClubOwner() {
    List<Usuario> new_owners = [];
    for (var i = 0; i < this.number_users; i++) {
      Usuario new_owner = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Dueño ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Dueño${i.toString()}@gmail.com',
          tipo: "Dueño de discoteca");

      new_owners.add(new_owner);
    }
    return new_owners;
  }

  List<Usuario> createOrganizer() {
    List<Usuario> new_organizers = [];
    for (var i = 0; i < this.number_users; i++) {
      Usuario new_organizer = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Organizador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Organizador${i.toString()}@gmail.com',
          tipo: "Organizador de eventos");

      new_organizers.add(new_organizer);
    }
    return new_organizers;
  }

  List<Usuario> createAdminis() {
    List<Usuario> new_admins = [];
    for (var i = 0; i < this.number_users; i++) {
      Usuario new_admin = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Administrador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Admin${i.toString()}@gmail.com',
          tipo: "Admin");

      new_admins.add(new_admin);
    }
    return new_admins;
  }
}

class LevelGenerator {
  static Nivel createLevel() {
    return Nivel(nombre: "Alien", numeroNivel: 4, puntos: 300);
  }
}
