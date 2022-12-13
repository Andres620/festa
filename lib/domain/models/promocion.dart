import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

/// Maps a string containing the correct information of an
/// promotion to an object of type Promocion.
Promocion promosionFromJson(String str) => Promocion.fromJson(json.decode(str));

///Maps an object of type Promocion to a string containing the
///event information.
String promosionToJson(Promocion data) => json.encode(data.toJson());

/// Entity class that allows interaction with promos.
class Promocion {
  Promocion({
    this.id,
    required this.fechaInicio,
    required this.fechaFin,
    required this.descripcion,
    required this.imagen,
  });

  final ObjectId? id;
  final DateTime fechaInicio;
  final DateTime fechaFin;
  final String descripcion;
  final String imagen;

  /// Maps a json.decode() containing the information of an
  /// promotion to an object of type Promosion.
  factory Promocion.fromJson(Map<String, dynamic> json) => Promocion(
        id: json["_id"],
        fechaInicio: json["FechaInicio"],
        fechaFin: json["FechaFin"],
        descripcion: json["Descripcion"],
        imagen: json["Imagen"],
      );

  /// Maps an Promocion to a json.encode() containing the
  /// promotion information.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "FechaInicio": fechaInicio.toString(),
        "FechaFin": fechaFin.toString(),
        "Descripcion": descripcion,
        "Imagen": imagen,
      };
}
