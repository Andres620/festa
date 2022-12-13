import '../models/usuario.dart';

/// Contract that must be implemented for an users repository to
/// interact with the application.
abstract class UserRepository {
  // Gets all the users that are registered in the
  // application to be able to analyze the users and their information.
  Future<List<Usuario>> getUsers();

  // Gets a user who is in the data repository to be able to
  //interact with the information
  Future<Usuario?> getUser(String identification);
}
