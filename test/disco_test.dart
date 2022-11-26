import 'package:festa/data/datasources/mongodb/credentials.dart';
import 'package:festa/data/datasources/mongodb/disco_mongodb.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test(
      'get all discotheques.',
      () async {
    DiscoMongodb discoMongodb = DiscoMongodb(
        connectionString: MONGO_URL, collection: COLLECTION_DiSCO);
    var response = await discoMongodb.getDiscos();
    expect(response.isNotEmpty, true);
  });
}