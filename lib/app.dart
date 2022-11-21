import 'package:festa/presentation/screens/list_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/provider/event_provider.dart';
import 'config/provider/promo_provider.dart';
import 'data/datasources/mongodb/credentials.dart';
import 'data/datasources/mongodb/events_mongodb.dart';
import 'data/datasources/mongodb/promotions_mongodb.dart';
import 'domain/use_case/cu_list_events.dart';
import 'domain/use_case/cu_list_promos.dart';

class Festa extends StatelessWidget {
  const Festa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => EventProvider(
                  cuListEvents: CuListEvents(EventsMongodb(
                      connectionString: MONGO_URL,
                      collection: COLLECTION_EVENTS)))),
          ChangeNotifierProvider(
              create: (context) => PromoProvider(
                cuListPromos: CuListPromos(PromotionsMongodb())
              ))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            canvasColor: const Color.fromARGB(255, 50, 50, 50),
            primarySwatch: Colors.blue,
          ),
          home: const ListEventsScreen(),
        ));
  }
}
