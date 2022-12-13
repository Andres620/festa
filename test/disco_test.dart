import 'package:festa/data/datasources/mongodb/credentials.dart';
import 'package:festa/data/datasources/mongodb/disco_mongodb.dart';
import 'package:festa/domain/models/promocion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:festa/domain/exceptions/app_exception.dart';

void main() {
  test('DiscoMongodb - get all discotheques.', () async {
    DiscoMongodb discoMongodb =
        DiscoMongodb(connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    var response = await discoMongodb.getDiscos();
    expect(response.isNotEmpty, true);
  });

  test('DiscoMongodb - get promo by disco', () async {
    var discoMongodb =
        DiscoMongodb(connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    final discoId = ObjectId?.fromHexString('63728041a1c8b7c18c2e53f1');
    var response = await discoMongodb.getPromosByDiscos(discoId);
    expect(response, isA<List<Promocion>>());
  });

  test('DiscoMongodb - get promo by disco fake', () async {
    var discoMongodb =
        DiscoMongodb(connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    final discoId = ObjectId?.fromHexString('63728041a1c8b7c18c2e7888');
    var response = await discoMongodb.getPromosByDiscos(discoId);
    expect(response, []);
  });

  test(
      'DiscoMongodb - Makes a query to the mongo atlas repository without correct credentials from the data layer and gets the data.',
      () async {
    DiscoMongodb discoMongodb = DiscoMongodb(
        connectionString: 'mongodb+srv://badconectionString',
        collection: COLLECTION_DiSCO);
    expect(() async => await discoMongodb.getDiscos(),
        throwsA((e) => e is AppException));
  });
}
