import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/config/provider/eventos_provider.dart';
import 'package:flutter_festa_proyect/domain/models/evento.dart';
import 'package:provider/provider.dart';

class ListarEventosScreen extends StatelessWidget {
  const ListarEventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventosProvider>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Eventos')),
        body: FutureBuilder<List<Evento>>(
          future: providerEventos.cuListarEventos.obtenerTodosEventos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                Evento evento = snapshot.data![index];
                return Text(evento.nombre);
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
