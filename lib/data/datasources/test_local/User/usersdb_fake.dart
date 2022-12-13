import '../../../../domain/models/usuario.dart';
import '../../../../domain/repositories/user_repository.dart';
import 'user_generator.dart';

/// Class that implements the evetns contract interacting with fake db
class Usersdbfake extends UserRepository {
  @override
  Future<List<Usuario>> getUsers() async {
    List<Usuario> response = UserGenerator(numberUsers: 3).createFiesteros();
    return response;
  }

  @override
  Future<Usuario> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
