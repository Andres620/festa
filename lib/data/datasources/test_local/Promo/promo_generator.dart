import '../../../../domain/models/promocion.dart';

class PromoGenerator {
  int number_promos;

  PromoGenerator({required this.number_promos});
  List<Promocion> createPromo() {
    List<Promocion> new_promos = [];
    final now = DateTime.now();
    for (var i = 0; i < this.number_promos; i++) {
      Promocion new_promo = Promocion(
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
