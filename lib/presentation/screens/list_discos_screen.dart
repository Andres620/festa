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
          backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
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
        child: Container(
            clipBehavior: Clip.none,
            height: 80,
            child: Card(
                color: const Color.fromARGB(250, 72, 72, 72),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.all(8),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      disco.nombre,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 235, 238, 39)),
                    ),
                    Text(
                      'Horas: Abre a las ${disco.hora}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 219, 177, 9)),
                    )
                  ],
                ))),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoDetailsScreen(disco)));
        },);
  }
}
