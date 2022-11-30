import 'package:flutter/material.dart';

import '../../domain/models/discoteca.dart';

class DiscoDetailsScreen extends StatelessWidget {
  final Discoteca disco;
  const DiscoDetailsScreen(this.disco, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(disco.nombre)),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                disco.imagen,
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Horas: Abre a las ${disco.hora}',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 22.0, fontStyle: FontStyle.italic),
                ),
              )
            ],
          ))),
    );
  }
}
