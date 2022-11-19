import 'package:festa/data/datasources/mongodb/promotions_mongodb.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  
  test('get all promotions - promotions_mongodb', (){
    var promotionsdb = PromotionsMongodb();
    promotionsdb.getPromociones();
  });
}