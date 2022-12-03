import 'dart:convert';

import 'package:flutter/material.dart';

class NotificationInfoScreen extends StatelessWidget {
  const NotificationInfoScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
    var event = json.decode(payload);
    return Scaffold(
        appBar: AppBar(
          title: Text(event["Nombre"]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.network(
                  event["Imagen"],
                  height: 500,
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    event["Tipo"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    event["Descripcion"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 22.0, fontStyle: FontStyle.italic),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Fecha: ${event["fecha"]}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 19.0),
                  ),
                ),
              ])),
        ));
  }
}
