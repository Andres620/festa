import 'package:festa/presentation/screens/list_promotions_by_disco_screen.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/basic.dart' as Center;

import '../../config/provider/event_provider.dart';
import '../../domain/models/discoteca.dart';
import '../../domain/models/evento.dart';
import 'list_events_by_disco_screen.dart';

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
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  margin: const EdgeInsets.only(top: 20.0, bottom: 4.0),
                  child: const Text(
                    'Eventos',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 22.0),
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
                    style: TextStyle(
                        fontSize: 22.0),
                  ),
                ),
                ListPromotionsByDiscoScreen(disco.id)
              ])),
        ));
  }
}
