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
