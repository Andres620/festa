import '../../../../domain/models/nivel.dart';
import '../../../../domain/models/usuario.dart';

class UserGenerator {
  int numberUsers;

  UserGenerator({required this.numberUsers});

  List<Usuario> createFiesteros() {
    List<Usuario> newFiesteros = [];
    for (var i = 0; i < numberUsers; i++) {
      Usuario newFiestero = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Fiestero ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Fiestero${i.toString()}@gmail.com',
          tipo: "Fiestero",
          nivel: LevelGenerator.createLevel());

      newFiesteros.add(newFiestero);
    }
    return newFiesteros;
  }

  List<Usuario> createClubOwner() {
    List<Usuario> newOwners = [];
    for (var i = 0; i < numberUsers; i++) {
      Usuario newOwner = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Dueño ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Dueño${i.toString()}@gmail.com',
          tipo: "Dueño de discoteca");

      newOwners.add(newOwner);
    }
    return newOwners;
  }

  List<Usuario> createOrganizer() {
    List<Usuario> newOrganizers = [];
    for (var i = 0; i < numberUsers; i++) {
      Usuario newOrganizer = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Organizador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Organizador${i.toString()}@gmail.com',
          tipo: "Organizador de eventos");

      newOrganizers.add(newOrganizer);
    }
    return newOrganizers;
  }

  List<Usuario> createAdminis() {
    List<Usuario> newAdmins = [];
    for (var i = 0; i < numberUsers; i++) {
      Usuario newAdmin = Usuario(
          id: i.toString(),
          identificacion: "100${i.toString()}",
          nombre: 'Administrador ${i.toString()}',
          edad: 22 + 1,
          telefono: 'Telefono ${i.toString()}',
          correElectronico: 'Admin${i.toString()}@gmail.com',
          tipo: "Admin");

      newAdmins.add(newAdmin);
    }
    return newAdmins;
  }
}

class LevelGenerator {
  static Nivel createLevel() {
    return Nivel(nombre: "Alien", numeroNivel: 4, puntos: 13000);
  }
}
