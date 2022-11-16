import 'package:flutter_festa_proyect/domain/models/promocion.dart';

class GeneradorPromocion {
  int cantidad_promocion;

  GeneradorPromocion({required this.cantidad_promocion});

  List<Promosion> crearPromociones() {
    List<Promosion> nuevas_promociones = [];
    final now = DateTime.now();
    for (var i = 0; i < this.cantidad_promocion; i++) {
      Promosion nueva_promocion = Promosion(
          id: i.toString(),
          fechaInicio: now,
          fechaFin: now.add(Duration(days: 10,)),
          descripcion: 'Esta es la promocion ${i.toString()}',
          imagen: 'URL ${i.toString()}'
          );
      nuevas_promociones.add(nueva_promocion);
    }
    return nuevas_promociones;
  }
}
