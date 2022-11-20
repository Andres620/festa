import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/event_provider.dart';
import '../../domain/models/evento.dart';

class ListEventsScreen extends StatelessWidget {
  const ListEventsScreen({super.key});

  ///Is the main method of the view and is responsible for displaying the information of each event.
  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    return Scaffold(
        appBar: AppBar(
            title: const Text('Eventos'),
            backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
        // drawer: Drawer(
        //   child: Column(
        //       children: [const Text("Opcion 1"), const Text("Opcion 2")]),
        // ),
        body: FutureBuilder<List<Evento>>(
          future: providerEventos.cuListEvents.getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    Evento event = snapshot.data![index];
                    return _buidCards(event);
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
        ));
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
                  '${evento.fecha.day} - ${evento.fecha.month}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 219, 177, 9)),
                )
              ],
            )));
  }
}
