// ignore_for_file: implementation_imports, library_prefixes

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/basic.dart' as Center;

import '../../config/provider/event_provider.dart';
import '../../domain/models/evento.dart';
import 'event_details_screen.dart';

class ListEventsByDiscoScreen extends StatelessWidget {
  final ObjectId? discoId;
  const ListEventsByDiscoScreen(this.discoId, {super.key});

  @override
  Widget build(BuildContext context) {
    final eventsProvider = Provider.of<EventProvider>(context);
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      FutureBuilder<List<Evento>>(
        future: eventsProvider.cuListEvents.getEventsByDisco(discoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      Evento event = snapshot.data![index];
                      return _buidCards(event, context);
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
  Widget _buidCards(Evento event, context) {
    return InkWell(
        child: Card(
            child: ListTile(
                title: Text(event.nombre),
                subtitle: Text(
                    'Fecha: ${event.fecha.year} - ${event.fecha.month} - ${event.fecha.day}'),
                leading: Image.network(event.imagen),
                trailing: const Icon(Icons.arrow_forward_rounded))),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(event)));
        });
  }
}
