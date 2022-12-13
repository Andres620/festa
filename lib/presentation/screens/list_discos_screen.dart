import 'package:festa/domain/models/discoteca.dart';
import 'package:festa/presentation/screens/disco_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/disco_provider.dart';

class ListDiscosScreen extends StatelessWidget {
  const ListDiscosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerDiscos = Provider.of<DiscoProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Discotecas'),
          foregroundColor: const Color.fromARGB(255, 245, 244, 244),
          backgroundColor: const Color.fromARGB(255, 103, 58, 183)),
      body: FutureBuilder<List<Discoteca>>(
        future: providerDiscos.cuListDisco.getAllDiscos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  Discoteca disco = snapshot.data![index];
                  return _buidCards(disco, context);
                }));
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

  Widget _buidCards(Discoteca disco, context) {
    return InkWell(
      child: Card(
          child: ListTile(
              title: Text(disco.nombre),
              subtitle: Text('Horas: Abre a las ${disco.hora}'),
              leading: Image.network(disco.imagen),
              trailing: const Icon(Icons.arrow_forward_rounded))),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DiscoDetailsScreen(disco)));
      },
    );
  }
}
