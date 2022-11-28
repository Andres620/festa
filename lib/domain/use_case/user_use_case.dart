import '../exceptions/app_exception.dart';
import '../models/usuario.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<List<Usuario>> getAllUsers() async {
    try {
      List<Usuario> usersList = await _userRepository.getUsers();
      if (usersList.isEmpty) {
        throw AppException(errorMessage: 'No users available at this time');
      }
      return usersList;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }

  Future<Usuario> getUserByIdentification(String identification) async {
    try {
      Usuario? user = await _userRepository.getUser(identification);
      if (user == null) {
        throw AppException(
            errorMessage:
                'There is no user with ID $identification. It is likely that the ID is misspelled. ');
      }
      return user;
    } catch (e) {
      throw AppException(errorMessage: e.toString());
    }
  }
}
