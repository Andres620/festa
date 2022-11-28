import 'package:festa/data/datasources/test_local/User/user_generator.dart';
import 'package:festa/domain/models/usuario.dart';
import 'package:festa/domain/repositories/user_repository.dart';

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
