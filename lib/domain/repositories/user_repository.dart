import '../models/usuario.dart';

abstract class UserRepository {
  Future<List<Usuario>> getUsers();
  //Future<Usuario?> getUser({String id});
  //Future<void> insertUser(Usuario user);
  //Future<void> updateUser(Usuario user);
  // Future<void> delete(String id);
}
