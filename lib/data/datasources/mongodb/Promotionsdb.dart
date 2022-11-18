// ignore: file_names
import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import '../../../domain/models/promocion.dart';
import '../../../domain/repositories/promocion_repository.dart';
import 'credentials.dart';

class Promotionsdb extends PromocionRepository{

  @override
  Future<List<Promocion>> getPromociones() async{
    var db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status = db.serverStatus();
    print(status);
    var collection = db.collection(COLLECTION_PROMOTIONS);
    var promotion = collection.find().toList();
    // var promotionDetails = promosionFromJson(promotion); 
    print(await collection.find().toList());

    //hacer lo del arabe den el video de ontener de una coleccion o leer la documentacion de mongodart

    await db.close();
    // ignore: todo
    // TODO: implement getPromociones
    throw UnimplementedError();
  }
}