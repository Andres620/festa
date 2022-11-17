// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

import 'nivel.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    this.id,
    required this.identificacion,
    required this.nombre,
    required this.edad,
    required this.telefono,
    required this.correElectronico,
    this.contrasena,
    required this.tipo,
    this.nivel,
  });

  final String? id;
  final String identificacion;
  final String nombre;
  final int edad;
  final String telefono;
  final String correElectronico;
  final String? contrasena;
  final String tipo;
  final Nivel? nivel;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        identificacion: json["Identificacion"],
        nombre: json["Nombre"],
        edad: json["Edad"],
        telefono: json["Telefono"],
        correElectronico: json["CorreElectronico"],
        contrasena: json["Contraseña"],
        tipo: json["Tipo"],
        nivel: Nivel.fromJson(json["Nivel"]),
      );

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
      };
}
