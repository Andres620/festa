import 'package:festa/data/datasources/mongodb/credentials.dart';
import 'package:festa/data/datasources/mongodb/user_mongodb.dart';
import 'package:festa/domain/exceptions/app_exception.dart';
import 'package:festa/domain/models/usuario.dart';
import 'package:festa/domain/use_case/user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get the information of a user who is registered with a valid user ID',
      () async {
    UserUseCase userUseCase = UserUseCase(
        UserMongodb(collection: COLLECTION_USER, connectionString: MONGO_URL));

    var response = await userUseCase.getUserByIdentification('1053872643');
    expect(response, isA<Usuario>());
  });

  test(
      'Get the information of a user who is NOT registered with a valid user ID',
      () async {
    UserUseCase userUseCase = UserUseCase(
        UserMongodb(collection: COLLECTION_USER, connectionString: MONGO_URL));

    expect(() async => await userUseCase.getUserByIdentification('1234567890'),
        throwsA((e) => e is AppException));
  });

  test('description', () {});
}
