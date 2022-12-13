import 'package:festa/domain/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/user_provider.dart';

class UserLevelScreen extends StatelessWidget {
  const UserLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Perfil de usuario'),
          foregroundColor: const Color.fromARGB(255, 245, 244, 244),
          backgroundColor: const Color.fromARGB(255, 103, 58, 183)),
      body: FutureBuilder<Usuario>(
        future: providerUser.userUseCase.getUserByIdentification('1053872643'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildContainer(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContainer(Usuario user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: const Icon(
                Icons.account_box_outlined,
                color: Color.fromARGB(248, 0, 0, 0),
                size: 100,
              ),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text('${user.nombre} - ${user.edad} años',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 10, 10, 10),
                  )),
            )),
          ],
        ),
        Container(
          height: 5,
          color: Color.fromARGB(255, 22, 255, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Nivel: ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 255, 21),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text('${user.nivel!.nombre} ',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.looks_4_outlined,
            color: Color.fromARGB(248, 0, 0, 0),
            size: 100,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Puntos: ${user.puntos} de ${user.nivel!.puntos}',
            style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Icon(
            Icons.facebook,
            color: Color.fromARGB(248, 19, 3, 253),
            size: 75,
          ),
        ),
      ],
    );
  }
}
