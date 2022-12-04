import 'package:festa/presentation/screens/list_promotions_by_disco_screen.dart';
import 'package:flutter/material.dart';
import '../../domain/models/discoteca.dart';
import 'list_events_by_disco_screen.dart';
import 'map_screen.dart';

class DiscoDetailsScreen extends StatelessWidget {
  final Discoteca disco;
  const DiscoDetailsScreen(this.disco, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(disco.nombre),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.network(
                  disco.imagen,
                  height: 500,
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Horas: Abre a las ${disco.hora}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 22.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Dirección: ${disco.direccion}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 22.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                      child: const Card(
                          child: ListTile(
                              title: Text("Ver en el mapa"),
                              leading: Icon(Icons.map),
                              trailing:
                                  Icon(Icons.arrow_forward_rounded))),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MapScreen(disco.latitud, disco.longitud)));
                      }),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.only(top: 20.0, bottom: 4.0),
                  child: const Text(
                    'Eventos',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                ListEventsByDiscoScreen(disco.id),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.only(top: 20.0, bottom: 4.0),
                  child: const Text(
                    'Promociones',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                ListPromotionsByDiscoScreen(disco.id)
              ])),
        ));
  }
}
