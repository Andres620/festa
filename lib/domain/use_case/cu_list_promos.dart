import 'package:flutter_festa_proyect/domain/models/promocion.dart';
import 'package:flutter_festa_proyect/domain/repositories/promocion_repository.dart';

class CuListPromos {
  final promocionRepository _promocionRepository;

  CuListPromos(this._promocionRepository);

  Future<List<Promocion>> getAllPromos() {
    return _promocionRepository.getPromociones();
  }
}
