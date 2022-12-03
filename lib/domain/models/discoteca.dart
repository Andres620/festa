// To parse this JSON data, do
//
//     final discoteca = discotecaFromJson(jsonString);

import 'dart:convert';

import 'package:festa/domain/models/promocion.dart';
import 'package:festa/domain/models/usuario.dart';
import 'package:mongo_dart/mongo_dart.dart';

Discoteca discotecaFromJson(String str) => Discoteca.fromJson(json.decode(str));

String discotecaToJson(Discoteca data) => json.encode(data.toJson());

class Discoteca {
    Discoteca({
        this.id,
        required this.nombre,
        required this.tipo,
        required this.hora,
        this.duenoDiscoteca,
        this.promociones,
        required this.imagen,
    });

    final ObjectId? id;
    final String nombre;
    final String tipo;
    final String hora;
    final ObjectId? duenoDiscoteca;
    final List<dynamic>? promociones;
    final String imagen;

    factory Discoteca.fromJson(Map<String, dynamic> json) => Discoteca(
        id: (json["_id"] as ObjectId),
        nombre: json["Nombre"],
        tipo: json["Tipo"],
        hora: json["Hora"],
        duenoDiscoteca: json["DueñoDiscoteca"],
        promociones: json["Promociones"],
        imagen: json["Imagen"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Tipo": tipo,
        "Hora": hora,
        "DueñoDiscoteca": duenoDiscoteca,
        "Promociones": List<dynamic>.from(promociones!.map((x) => x)),
        "Imagen": imagen,
    };
}

