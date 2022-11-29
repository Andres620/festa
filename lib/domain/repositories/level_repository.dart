import '../models/nivel.dart';

abstract class LevelRepository {
  Future<List<Nivel>> getLevels();
}
