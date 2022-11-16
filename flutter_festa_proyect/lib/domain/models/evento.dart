// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_festa_proyect/domain/models/discoteca.dart';
import 'package:flutter_festa_proyect/domain/models/promocion.dart';
import 'package:flutter_festa_proyect/domain/models/usuario.dart';

Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

String eventoToJson(Evento data) => json.encode(data.toJson());

class Evento {
    Evento({
        this.id,
        required this.nombre,
        required this.descripcion,
        required this.tipo,
        required this.fecha,
        required this.organizadorEventos,
        required this.discoteca,
        this.promocion,
    });

    final String? id;
    final String nombre;
    final String descripcion;
    final String tipo;
    final DateTime fecha;
    final Usuario organizadorEventos;
    final List<Discoteca> discoteca;
    final Promosion? promocion;

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        id: json["_id"],
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        tipo: json["Tipo"],
        fecha: json["Fecha"],
        organizadorEventos: Usuario.fromJson(json["OrganizadorEventos"]),
        discoteca: List<Discoteca>.from(json["Discoteca"].map((x) => x)),
        promocion: Promosion.fromJson(json["Promocion"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Nombre": nombre,
        "Descripcion": descripcion,
        "Tipo": tipo,
        "Fecha": fecha,
        "OrganizadorEventos": organizadorEventos.toJson(),
        "Discoteca": List<dynamic>.from(discoteca.map((x) => x)),
        "Promocion": promocion!.toJson(),
    };
}

