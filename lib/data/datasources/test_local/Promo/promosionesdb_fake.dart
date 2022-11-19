
import '../../../../domain/models/promocion.dart';
import '../../../../domain/repositories/promocion_repository.dart';
import 'promo_generator.dart';


class PromocionesdbFake extends PromocionRepository {
  @override
  Future<List<Promocion>> getPromociones() async {
    List<Promocion> response = PromoGenerator(numberPromos: 3).createPromo();

    return response;
  }
}
