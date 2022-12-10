import '../models/promocion.dart';

/// Contract that must be implemented for an promotion repository to
/// interact with the application.
abstract class PromocionRepository {
  //Signature of a method to obtain all the promotions that are registered
  //in a data repository
  Future<List<Promocion>> getPromociones();
}
