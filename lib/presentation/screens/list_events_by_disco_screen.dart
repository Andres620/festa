// ignore_for_file: implementation_imports, library_prefixes

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/basic.dart' as Center;

import '../../config/provider/event_provider.dart';
import '../../domain/models/evento.dart';

class ListEventsByDiscoScreen extends StatelessWidget {
  final ObjectId? discoId;
  const ListEventsByDiscoScreen(this.discoId, {super.key});

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FutureBuilder<List<Evento>>(
        future: providerEventos.cuListEvents.getEventsByDisco(discoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      Evento event = snapshot.data![index];
                      return _buidCards(event);
                    }))
                : const Text("La discoteca no tiene eventos en este momento");
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}',
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 18.0, color: Color.fromARGB(255, 235, 238, 39)));
          }
          return const Center.Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          );
        },
      )
    ]));
  }

  /// Builds the structure to display the information of an event.
  Widget _buidCards(Evento evento) {
    return Container(
        clipBehavior: Clip.none,
        height: 80,
        child: Card(
            color: const Color.fromARGB(250, 72, 72, 72),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.all(8),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  evento.nombre,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 235, 238, 39)),
                ),
                Text(
                  evento.tipo,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 211, 210, 208)),
                ),
                Text(
                  '${evento.fecha.year} - ${evento.fecha.month} - ${evento.fecha.day}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 219, 177, 9)),
                )
              ],
            )));
  }
}
