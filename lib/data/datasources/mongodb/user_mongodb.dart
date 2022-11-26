import 'package:mongo_dart/mongo_dart.dart';
import '../../../domain/exceptions/app_exception.dart';
import '../../../domain/models/usuario.dart';
import '../../../domain/repositories/user_repository.dart';

class UserMongodb extends UserRepository {
  final String connectionString;
  final String collection;

  UserMongodb({required this.connectionString, required this.collection});

  @override
  Future<List<Usuario>> getUsers() async {
    try {
      List<Usuario> usersList = [];
      var db = await Db.create(connectionString);
      await db.open();
      var userResponse = await db.collection(collection).find().toList();
      for (var user in userResponse) {
        usersList.add(Usuario.fromJson(user));
      }
      db.close();
      return usersList;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }

  @override
  Future<Usuario?> getUser(String identification) async {
    try {
      Usuario user;
      var db = await Db.create(connectionString);
      await db.open();
      var userResponse = await db
          .collection(collection)
          .findOne(where.match('Identificacion', identification));
      user = Usuario.fromJson(userResponse!);
      return user;
    } catch (e) {
      AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
}
