import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

/// Maps a string containing the correct information of an 
/// event to an object of type event.
Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

///Maps an object of type event to a string containing the 
///event information. 
String eventoToJson(Evento data) => json.encode(data.toJson());

/// Entity class that allows interaction with events.
class Evento {
  Evento({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.tipo,
    required this.imagen,
    required this.fecha,
    this.organizadorEventos,
    this.discoteca,
    this.promocion,
  });

  final ObjectId? id;
  final String nombre;
  final String descripcion;
  final String tipo;
  final String imagen;
  final DateTime fecha;
  final ObjectId? organizadorEventos;
  final List<dynamic>? discoteca;
  final ObjectId? promocion;

  /// Maps a json.decode() containing the information of an 
  /// event to an object of type event. 
  factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        id: (json["_id"] as ObjectId),
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        tipo: json["Tipo"],
        imagen: json["Imagen"],
        fecha: json["Fecha"],
        organizadorEventos: json["OrganizadorEventos"],
        discoteca: json["Discoteca"],
        promocion: json["Promocion"]
      );

  /// Maps an event to a json.encode() containing the
  /// event information. 
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Tipo": tipo,
        "Imagen": imagen,
        "Fecha": fecha.toIso8601String(),
        "OrganizadorEventos": organizadorEventos,
        "Discoteca": List<dynamic>.from(discoteca!.map((x) => x)),
        "Promocion": promocion,
      };
}
