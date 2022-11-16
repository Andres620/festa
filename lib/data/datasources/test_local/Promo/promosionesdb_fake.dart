import 'package:festa/domain/models/promocion.dart';
import 'package:festa/domain/repositories/promocion_repository.dart';
import 'package:festa/data/datasources/test_local/Promo/promo_generator.dart';

class PromocionesdbFake extends promocionRepository {
  @override
  Future<List<Promocion>> getPromociones() async {
    List<Promocion> response = PromoGenerator(number_promos: 3).createPromo();

    return response;
  }
}
