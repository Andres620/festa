import 'dart:convert';

import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
    required this.payload,
  }) : super(key: key);

  final String payload;

  @override
  Widget build(BuildContext context) {
      var evento = json.decode(payload);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festa'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Card(
                color: const Color.fromARGB(250, 72, 72, 72),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.all(8),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      evento["Nombre"],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 235, 238, 39)),
                    ),
                    Text(
                      evento["Tipo"],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 211, 210, 208)),
                    ),
                    Text(
                      'Lugar: ${evento["Descripcion"]}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 235, 238, 39)),
                    )
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}