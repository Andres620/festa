import '../models/usuario.dart';

abstract class UserRepository {
  Future<List<Usuario>> getUsers();
  Future<Usuario?> getUser(String identification);
  //Future<void> insertUser(Usuario user);
  //Future<void> updateUser(Usuario user);
  // Future<void> delete(String id);
}
