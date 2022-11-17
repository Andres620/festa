import 'package:festa/data/datasources/test_local/User/user_generator.dart';
import 'package:festa/domain/models/usuario.dart';
import 'package:festa/domain/repositories/user_repository.dart';

class Usersdbfake extends UserRepository {
  @override
  Future<List<Usuario>> getUsers() async {
    List<Usuario> response = UserGenerator(number_users: 3).createFiesteros();
    return response;
  }
}
