
import '../../../../domain/models/discoteca.dart';
import '../../../../domain/models/usuario.dart';
import '../User/user_generator.dart';

class ClubGenerator {
  int number_clubs;

  ClubGenerator({required this.number_clubs});

  List<Discoteca> createClubs() {
    List<Discoteca> newClubs = [];
    for (var i = 0; i < this.number_clubs; i++) {
      Discoteca newClub = Discoteca(
        id: i.toString(),
        nombre: 'Disco ${i.toString()}',
        tipo: 'Discoteca',
        hora: '3:00 a.m',
        duenoDiscoteca: _createUser(),
      );
    }
    return newClubs;
  }

  Usuario _createUser (){
    return UserGenerator(number_users: 1).createClubOwner()[0];
  }
}
