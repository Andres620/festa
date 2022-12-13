import '../exceptions/app_exception.dart';
import '../models/usuario.dart';
import '../repositories/user_repository.dart';

/// Control class that interacts with the users data
/// repository to apply business logic.
class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  /// Gets all users from a repository and returns them to be used
  /// as an object of type Usuario.
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

  /// Gets a user by its identification number to apply the business logic
  /// of the application to it 
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
