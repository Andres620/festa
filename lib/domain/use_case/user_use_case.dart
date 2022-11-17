import '../models/usuario.dart';
import '../repositories/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<List<Usuario>> getAllUsers() {
    return _userRepository.getUsers();
  }
}
