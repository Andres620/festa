import 'package:festa/data/datasources/mongodb/Promotionsdb.dart';
import 'package:flutter_test/flutter_test.dart';
void main(){
  
  test('get all promotions - promotionsdb', (){
    var promotionsdb = Promotionsdb();
    promotionsdb.getPromociones();
  });
}