import 'package:festa/domain/models/discoteca.dart';
import 'package:festa/domain/repositories/disco_repository.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../domain/exceptions/app_exception.dart';
import '../../../domain/models/promocion.dart';

class DiscoMongodb extends DiscoRepository {
  final String connectionString;
  final String collection;

  DiscoMongodb({required this.connectionString, required this.collection});

  @override
  Future<List<Discoteca>> getDiscos() async {
    try {
      List<Discoteca> discoList = [];
      var db = await Db.create(connectionString);
      await db.open();
      var discoResponse = await db.collection(collection).find().toList();

      for (var discoMap in discoResponse) {
        discoList.add(Discoteca.fromJson(discoMap));
      }
      db.close();
      return discoList;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }

  @override
  Future<List<Promocion>> getPromosByDiscos(ObjectId? discoId) async {
    try {
      List<Promocion> promoList = [];
      var db = await Db.create(connectionString);
      await db.open();
      print("entrada 1");
      final pipeline = AggregationPipelineBuilder()
          .addStage(Match(where.eq("_id", discoId).map['\$query']))
          .addStage(Lookup(
              from: "Promocion",
              localField: "Promociones",
              foreignField: "_id",
              as: "promosByDisco"))
          .build();
      var discoResponse =
          await db.collection(collection).aggregateToStream(pipeline).toList();
      for (var discoMap in discoResponse) {
        for (var promoByDiscoMap in discoMap['promosByDisco']) {
          promoList.add(Promocion.fromJson(promoByDiscoMap));
        }
      }
      db.close();
      return promoList;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
}
