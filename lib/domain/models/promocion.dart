// To parse this JSON data, do
//
//     final promocion = promosionFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Promocion promosionFromJson(String str) => Promocion.fromJson(json.decode(str));

String promosionToJson(Promocion data) => json.encode(data.toJson());

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

    factory Promocion.fromJson(Map<String, dynamic> json) => Promocion(
        id: json["_id"],
        fechaInicio: json["FechaInicio"],
        fechaFin: json["FechaFin"],
        descripcion: json["Descripcion"],
        imagen: json["Imagen"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "FechaInicio": fechaInicio,
        "FechaFin": fechaFin,
        "Descripcion": descripcion,
        "Imagen": imagen,
    };
}

