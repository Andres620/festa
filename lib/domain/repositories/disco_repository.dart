import 'package:mongo_dart/mongo_dart.dart';

import '../models/discoteca.dart';
import '../models/promocion.dart';

/// Contract that must be implemented for an Disco repository to
/// interact with the application.
abstract class DiscoRepository {
  // Signature of a method to get all the nightclubs that are in a data repository
  Future<List<Discoteca>> getDiscos();

  // Signature of a method to obtain the promotions that a discotheque
  // has associated with it
  Future<List<Promocion>> getPromosByDiscos(ObjectId? discoId);
}
