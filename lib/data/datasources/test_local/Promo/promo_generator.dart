
import '../../../../domain/models/promocion.dart';

class PromoGenerator {
  int numberPromos;

  PromoGenerator({required this.numberPromos});
  List<Promocion> createPromo() {
    List<Promocion> newPromos = [];
    final now = DateTime.now();
    for (var i = 0; i < numberPromos; i++) {
      Promocion newPromo = Promocion(
          fechaInicio: now,
          fechaFin: now.add(const Duration(
            days: 10,
          )),
          descripcion: 'Esta es la promocion ${i.toString()}',
          imagen: 'URL ${i.toString()}');
      newPromos.add(newPromo);
    }
    return newPromos;
  }
}
