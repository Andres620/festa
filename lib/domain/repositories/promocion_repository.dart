
import '../models/promocion.dart';

abstract class PromocionRepository {
  Future<List<Promocion>> getPromociones();
}
