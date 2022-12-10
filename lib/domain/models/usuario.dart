import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

import 'nivel.dart';

/// Maps a string containing the correct information of an
/// user to an object of type Usuario.
Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

/// Maps an object of type Usuario to a string containing the
/// user information.
String usuarioToJson(Usuario data) => json.encode(data.toJson());

/// Entity class that allows interaction with Users.
class Usuario {
  Usuario(
      {this.id,
      required this.identificacion,
      required this.nombre,
      required this.edad,
      required this.telefono,
      required this.correElectronico,
      this.contrasena,
      required this.tipo,
      this.nivel,
      this.puntos});

  final ObjectId? id;
  final String identificacion;
  final String nombre;
  final int edad;
  final String telefono;
  final String correElectronico;
  final String? contrasena;
  final String tipo;
  final Nivel? nivel;
  final int? puntos;

  /// Maps a json.decode() containing the information of an
  /// user to an object of type Usuario.
  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
      id: json["_id"],
      identificacion: json["Identificacion"],
      nombre: json["Nombre"],
      edad: json["Edad"],
      telefono: json["Telefono"],
      correElectronico: json["CorreElectronico"],
      contrasena: json["Contraseña"],
      tipo: json["Tipo"],
      nivel: json["Nivel"] == null ? null : Nivel.fromJson(json["Nivel"]),
      puntos: json["Puntos"] ?? json["Puntos"]);

  /// Maps an Usuario to a json.encode() containing the
  /// user information.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Identificacion": identificacion,
        "Nombre": nombre,
        "Edad": edad,
        "Telefono": telefono,
        "CorreElectronico": correElectronico,
        "Contraseña": contrasena,
        "Tipo": tipo,
        "Nivel": nivel!.toJson(),
        "Puntos": puntos
      };
}
