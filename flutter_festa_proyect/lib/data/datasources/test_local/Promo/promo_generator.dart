import 'package:flutter_festa_proyect/domain/models/promocion.dart';

class PromoGenerator {
  int number_promos;

  PromoGenerator({required this.number_promos});
  List<Promosion> createPromo() {
    List<Promosion> new_promos = [];
    final now = DateTime.now();
    for (var i = 0; i < this.number_promos; i++) {
      Promosion new_promo = Promosion(
          id: i.toString(),
          fechaInicio: now,
          fechaFin: now.add(const Duration(days: 10,)),
          descripcion: 'Esta es la promocion ${i.toString()}',
          imagen: 'URL ${i.toString()}'
          );
      new_promos.add(new_promo);
    }
    return new_promos;
  }
}
