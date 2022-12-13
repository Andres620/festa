import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/event_provider.dart';
import '../../domain/models/evento.dart';
import 'event_details_screen.dart';

class ListEventsScreen extends StatelessWidget {
  const ListEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Eventos'),
          foregroundColor: const Color.fromARGB(255, 245, 244, 244),
          backgroundColor: const Color.fromARGB(255, 103, 58, 183)),
      body: FutureBuilder<List<Evento>>(
        future: providerEventos.cuListEvents.getAllEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  Evento event = snapshot.data![index];
                  return _buidCards(event, context);
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
