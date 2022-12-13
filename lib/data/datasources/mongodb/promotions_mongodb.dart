// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'package:mongo_dart/mongo_dart.dart';
import '../../../domain/exceptions/app_exception.dart';
import '../../../domain/models/promocion.dart';
import '../../../domain/repositories/promocion_repository.dart';
import 'credentials.dart';

/// Class that communicates with MongoDB to interact with promotions.
class PromotionsMongodb extends PromocionRepository{

  /// Returns all promotions from the database.
  @override
  Future<List<Promocion>> getPromociones() async{
    try{
      List<Promocion> promotionsList = [];
      var db = await Db.create(MONGO_URL);
      await db.open();
      var promotions_response =
          await db.collection(COLLECTION_PROMOTIONS).find().toList();

      for (var promotion_map in promotions_response) {
        promotionsList.add(Promocion.fromJson(promotion_map));
      }
      db.close();
      return promotionsList;
    }catch(e){
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
}