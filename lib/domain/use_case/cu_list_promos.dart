import 'package:festa/domain/models/promocion.dart';
import 'package:festa/domain/repositories/promocion_repository.dart';

class CuListPromos {
  final promocionRepository _promocionRepository;

  CuListPromos(this._promocionRepository);

  Future<List<Promocion>> getAllPromos() {
    return _promocionRepository.getPromociones();
  }
}
