import 'package:festa/domain/models/discoteca.dart';

import '../repositories/disco_repository.dart';

class CuListDisco {
  final DiscoRepository _discoRepository;

  CuListDisco(this._discoRepository);

  Future<List<Discoteca>> getAllDiscos() {
    return _discoRepository.getDiscos();
  }
}