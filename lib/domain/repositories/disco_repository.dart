import 'package:festa/domain/models/promocion.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../models/discoteca.dart';

abstract class DiscoRepository{
  Future<List<Discoteca>> getDiscos();
  Future<List<Promocion>> getPromosByDiscos(ObjectId? discoId);
}