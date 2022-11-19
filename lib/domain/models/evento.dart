// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

String eventoToJson(Evento data) => json.encode(data.toJson());

class Evento {
  Evento({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.tipo,
    required this.fecha,
    this.organizadorEventos,
    this.discoteca,
    this.promocion,
  });

  final ObjectId? id;
  final String nombre;
  final String descripcion;
  final String tipo;
  final DateTime fecha;
  final ObjectId? organizadorEventos;
  final List<dynamic>? discoteca;
  final ObjectId? promocion;

  factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        id: (json["_id"] as ObjectId),
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        tipo: json["Tipo"],
        fecha: json["Fecha"],
        organizadorEventos: json["OrganizadorEventos"],
        discoteca: json["Discoteca"],
        promocion: json["Promocion"]
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Tipo": tipo,
        "Fecha": fecha.toIso8601String(),
        "OrganizadorEventos": organizadorEventos,
        "Discoteca": List<dynamic>.from(discoteca!.map((x) => x)),
        "Promocion": promocion,
      };
}
