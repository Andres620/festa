import 'package:flutter_festa_proyect/domain/models/promocion.dart';
import 'package:flutter_festa_proyect/domain/repositories/promocion_repository.dart';
import 'package:flutter_festa_proyect/data/datasources/test_local/Promo/promo_generator.dart';

class PromocionesdbFake extends promocionRepository {
  @override
  Future<List<Promocion>> getPromociones() async {
    List<Promocion> response = PromoGenerator(number_promos: 3).createPromo();

    return response;
  }
}
