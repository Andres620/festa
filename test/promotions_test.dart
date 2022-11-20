import 'package:festa/data/datasources/mongodb/promotions_mongodb.dart';
import 'package:festa/domain/models/promocion.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mongo_dart/mongo_dart.dart';
void main(){
  test('get all promotions - promotions_mongodb', () async {
    var promotionsdb = PromotionsMongodb();
    var response = await promotionsdb.getPromociones() ;
    expect(response.length, 2);
  });

  test('json to promotion', () {
    var promotionJson = {
      "_id":ObjectId(),
      "FechaInicio": DateTime.now(),
      "FechaFin": DateTime.now(),
      "Descripcion":"promotion test",
      "Imagen":"imageTest.jpg"};

    var response = Promocion.fromJson(promotionJson);
    expect(response, isA<Promocion>());
  });

  test('promotion to json', () {
    var promotion = Promocion(
      id: ObjectId(),
      fechaInicio: DateTime.now(),
      fechaFin: DateTime.now(),
      descripcion: "test promotion",
      imagen: "imageTest.jpg"
    );

    var response = promosionToJson(promotion);
    expect(response, isA<String>());
  });

}
