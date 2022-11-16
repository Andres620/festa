// To parse this JSON data, do
//
//     final discoteca = discotecaFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_festa_proyect/domain/models/promocion.dart';
import 'package:flutter_festa_proyect/domain/models/usuario.dart';

Discoteca discotecaFromJson(String str) => Discoteca.fromJson(json.decode(str));

String discotecaToJson(Discoteca data) => json.encode(data.toJson());

class Discoteca {
    Discoteca({
        this.id,
        required this.nombre,
        required this.tipo,
        required this.hora,
        required this.duenoDiscoteca,
        this.promociones,
    });

    final String? id;
    final String nombre;
    final String tipo;
    final String hora;
    final Usuario duenoDiscoteca;
    final List<Promosion>? promociones;

    factory Discoteca.fromJson(Map<String, dynamic> json) => Discoteca(
        id: json["_id"],
        nombre: json["Nombre"],
        tipo: json["Tipo"],
        hora: json["Hora"],
        duenoDiscoteca: Usuario.fromJson(json["DueñoDiscoteca"]),
        promociones: List<Promosion>.from(json["Promociones"].map((x) => Promosion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Tipo": tipo,
        "Hora": hora,
        "DueñoDiscoteca": duenoDiscoteca.toJson(),
        "Promociones": List<dynamic>.from(promociones!.map((x) => x.toJson())),
    };
}

