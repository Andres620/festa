
import '../../../../domain/models/discoteca.dart';
import '../../../../domain/models/usuario.dart';
import '../User/user_generator.dart';

class ClubGenerator {
  int numberClubs;

  ClubGenerator({required this.numberClubs});

  List<Discoteca> createClubs() {
    List<Discoteca> newClubs = [];
    for (var i = 0; i < numberClubs; i++) {
      Discoteca newClub = Discoteca(
        id: i.toString(),
        nombre: 'Disco ${i.toString()}',
        tipo: 'Discoteca',
        hora: '3:00 a.m',
        duenoDiscoteca: _createUser(),
      );
      newClubs.add(newClub);
    }
    return newClubs;
  }

  Usuario _createUser (){
    return UserGenerator(numberUsers: 1).createClubOwner()[0];
  }
}
