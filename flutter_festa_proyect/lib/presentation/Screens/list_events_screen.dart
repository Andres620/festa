import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/config/provider/event_provider.dart';
import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:provider/provider.dart';

class ListEventsScreen extends StatelessWidget {
  const ListEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Eventos')),
        body: FutureBuilder<List<Evento>>(
          future: providerEventos.cuListEvents.getAllEvents(),

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                Evento event = snapshot.data![index];
                return Text(event.nombre);
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
}
