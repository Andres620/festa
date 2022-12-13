import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

/// Maps a string containing the correct information of an
/// dico to an object of type Dicoteca.
Discoteca discotecaFromJson(String str) => Discoteca.fromJson(json.decode(str));

///Maps an object of type Dicoteca to a string containing the
///dico information.
String discotecaToJson(Discoteca data) => json.encode(data.toJson());

/// Entity class that allows interaction with Discos.
class Discoteca {
  Discoteca({
    this.id,
    required this.nombre,
    required this.tipo,
    required this.hora,
    this.duenoDiscoteca,
    this.promociones,
    required this.imagen,
    required this.direccion,
    required this.latitud,
    required this.longitud,
  });

  final ObjectId? id;
  final String nombre;
  final String tipo;
  final String hora;
  final ObjectId? duenoDiscoteca;
  final List<dynamic>? promociones;
  final String imagen;
  final String direccion;
  final double latitud;
  final double longitud;

  /// Maps a json.decode() containing the information of an
  /// disco to an object of type Discoteca.
  factory Discoteca.fromJson(Map<String, dynamic> json) => Discoteca(
      id: (json["_id"] as ObjectId),
      nombre: json["Nombre"],
      tipo: json["Tipo"],
      hora: json["Hora"],
      duenoDiscoteca: json["DueñoDiscoteca"],
      promociones: json["Promociones"],
      imagen: json["Imagen"],
      direccion: json["Direccion"],
      latitud: json["Latitud"],
      longitud: json["Longitud"]);

  /// Maps an Discoteca to a json.encode() containing the
  /// disco information.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Tipo": tipo,
        "Hora": hora,
        "DueñoDiscoteca": duenoDiscoteca,
        "Promociones": List<dynamic>.from(promociones!.map((x) => x)),
        "Imagen": imagen,
        "Direccion": direccion,
        "Latitud": latitud,
        "Longitud": longitud,
      };
}
