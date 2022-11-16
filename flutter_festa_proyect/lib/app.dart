import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/config/provider/eventos_provider.dart';
import 'package:flutter_festa_proyect/presentation/Screens/listar_eventos_screen.dart';
import 'package:provider/provider.dart';

import 'data/datasources/test_local/Eventos/Eventosdb_fake.dart';
import 'domain/caso_uso/evento/cu_listar_eventos.dart';

class Festa extends StatelessWidget {
  const Festa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => 
        EventosProvider(cuListarEventos: CuListarEventos(EventosdbFake())) )
      ],
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListarEventosScreen(),
    )
    );
  }
}

