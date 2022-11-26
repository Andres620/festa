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

  Widget _buildContainer(Usuario user){
    return Container(
      clipBehavior: Clip.none,
      child: Text(user.nombre),
    );
  }

}
