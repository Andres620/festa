import 'package:flutter/cupertino.dart';

import '../../domain/use_case/user_use_case.dart';

/// Class that manages dependency injection for users.
class UserProvider extends ChangeNotifier {
  final UserUseCase userUseCase;
  UserProvider({required this.userUseCase});
}
