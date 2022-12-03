import 'package:festa/presentation/screens/list_promotions_by_disco_screen.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/basic.dart' as Center;

import '../../config/provider/event_provider.dart';
import '../../domain/models/discoteca.dart';
import '../../domain/models/evento.dart';
import 'list_events_by_disco_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  final Evento event;
  const EventDetailsScreen(this.event, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(event.nombre),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    event.tipo,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 22.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    event.descripcion,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 22.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Fecha: ${event.fecha.year} - ${event.fecha.month} - ${event.fecha.day}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 19.0),
                  ),
                ),
              ])),
        ));
  }
}
