import '../exceptions/app_exception.dart';
import '../models/promocion.dart';
import '../repositories/promocion_repository.dart';

/// Control class that interacts with the promos data repository
/// to apply business logic.
class CuListPromos {
  final PromocionRepository _promocionRepository;

  CuListPromos(this._promocionRepository);

  Future<List<Promocion>> getAllPromos() {
    try {
      return _promocionRepository.getPromociones();
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
