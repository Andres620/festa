import '../models/promocion.dart';
import '../repositories/promocion_repository.dart';

class CuListPromos {
  final PromocionRepository _promocionRepository;

  CuListPromos(this._promocionRepository);

  Future<List<Promocion>> getAllPromos() {
    return _promocionRepository.getPromociones();
  }
}
