// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

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

class Nivel {
    Nivel({
        required this.nombre,
        this.descripcion,
        required this.numeroNivel,
        required this.puntos,
    });

    final String nombre;
    final String? descripcion;
    final int numeroNivel;
    final int puntos;

    factory Nivel.fromJson(Map<String, dynamic> json) => Nivel(
        nombre: json["Nombre"],
        descripcion: json["Descripcion"],
        numeroNivel: json["NumeroNivel"],
        puntos: json["Puntos"],
    );

    Map<String, dynamic> toJson() => {
        "Nombre": nombre,
        "Descripcion": descripcion,
        "NumeroNivel": numeroNivel,
        "Puntos": puntos,
    };
}

