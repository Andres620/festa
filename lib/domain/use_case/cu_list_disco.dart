import 'package:festa/domain/models/discoteca.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../exceptions/app_exception.dart';
import '../models/promocion.dart';
import '../repositories/disco_repository.dart';

class CuListDisco {
  final DiscoRepository _discoRepository;

  CuListDisco(this._discoRepository);

  Future<List<Discoteca>> getAllDiscos() {
    return _discoRepository.getDiscos();
  }

  Future<List<Promocion>> getPromosByDiscos(ObjectId? discoId) async {
    try {
      List<Promocion> promotionsList =
          await _discoRepository.getPromosByDiscos(discoId);
      if (promotionsList.isEmpty) {
        return promotionsList;
      }
      return promotionsList;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
