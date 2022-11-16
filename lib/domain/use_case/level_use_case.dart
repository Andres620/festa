import 'package:festa/domain/models/nivel.dart';
import 'package:festa/domain/repositories/level_repository.dart';

class LevelUseCase {
  final LevelRepository _levelRepository;

  LevelUseCase(this._levelRepository);

  Future<List<Nivel>> getAllLevels() {
    return _levelRepository.getLevels();
  }
}
