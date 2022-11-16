import 'package:festa/presentation/screens/list_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/provider/event_provider.dart';
import 'data/datasources/test_local/Event/eventsdb_fake.dart';
import 'domain/use_case/cu_list_events.dart';


class Festa extends StatelessWidget {
  const Festa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => 
        EventProvider(cuListEvents: CuListEvents(EventsdbFake())) )
      ],
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListEventsScreen(),
    )
    );
  }
}

