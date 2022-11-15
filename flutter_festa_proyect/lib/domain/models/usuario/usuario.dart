// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.id,
    required this.identificacion,
    required this.nombre,
    required this.edad,
    required this.telefono,
    required this.correElectronico,
    required this.contrasea,
    required this.tipo,
    required this.nivel,
  });

  Id id;
  String identificacion;
  String nombre;
  int edad;
  String telefono;
  String correElectronico;
  String contrasea;
  String tipo;
  Nivel nivel;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: Id.fromJson(json["_id"]),
        identificacion: json["Identificacion"],
        nombre: json["Nombre"],
        edad: json["Edad"],
        telefono: json["Telefono"],
        correElectronico: json["CorreElectronico"],
        contrasea: json["Contraseña"],
        tipo: json["Tipo"],
        nivel: Nivel.fromJson(json["Nivel"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id.toJson(),
        "Identificacion": identificacion,
        "Nombre": nombre,
        "Edad": edad,
        "Telefono": telefono,
        "CorreElectronico": correElectronico,
        "Contraseña": contrasea,
        "Tipo": tipo,
        "Nivel": nivel.toJson(),
      };
}

class Id {
  Id({
    required this.oid,
  });

  String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

class Nivel {
  Nivel({
    required this.nombre,
    required this.descripcion,
    required this.numeroNivel,
    required this.puntos,
  });

  String nombre;
  String descripcion;
  int numeroNivel;
  int puntos;

  factory Nivel.fromJson(Map<String, dynamic> json) => Nivel(
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        numeroNivel: json["NumeroNivel"],
        puntos: json["Puntos"],
      );

  Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "NumeroNivel": numeroNivel,
        "Puntos": puntos,
      };
}

