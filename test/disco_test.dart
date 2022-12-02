import 'package:festa/data/datasources/mongodb/credentials.dart';
import 'package:festa/data/datasources/mongodb/disco_mongodb.dart';
import 'package:festa/domain/models/promocion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() {
  test('get all discotheques.', () async {
    DiscoMongodb discoMongodb =
        DiscoMongodb(connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    var response = await discoMongodb.getDiscos();
    expect(response.isNotEmpty, true);
  });

  test('get promo by disco', () async {
    var discoMongodb = DiscoMongodb(
        connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    final discoId = ObjectId?.fromHexString('63728041a1c8b7c18c2e53f1');
    var response = await discoMongodb.getPromosByDiscos(discoId);
    expect(response, isA<List<Promocion>>());
  });
}
