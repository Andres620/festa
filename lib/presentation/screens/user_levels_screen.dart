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
          title: const Text('Usuario'),
          backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
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
                color: Color.fromARGB(249, 219, 216, 216),
                size: 100,
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Text('${user.nombre} - ${user.edad} años',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 201, 201, 199),
                  )),
            ))
          ],
        ),
        Container(
          height: 5,
          color: const Color.fromARGB(255, 235, 238, 39),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('Nivel: ',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 250, 200, 0),
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Text('${user.nivel!.nombre} ',
                  style: const TextStyle(
                    fontSize: 35,
                    color: Color.fromARGB(255, 201, 201, 199),
                  )),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Puntos: ${user.puntos} de ${user.nivel!.puntos}',
            style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 201, 201, 199),
            ),
          ),
        )
      ],
    );
  }
}
