import 'package:festa/domain/use_case/cu_list_disco.dart';
import 'package:festa/presentation/screens/list_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/provider/disco_provider.dart';
import 'config/provider/event_provider.dart';
import 'config/provider/promo_provider.dart';
import 'config/provider/user_provider.dart';
import 'data/datasources/mongodb/credentials.dart';
import 'data/datasources/mongodb/disco_mongodb.dart';
import 'data/datasources/mongodb/events_mongodb.dart';
import 'data/datasources/mongodb/promotions_mongodb.dart';
import 'data/datasources/mongodb/user_mongodb.dart';
import 'domain/use_case/cu_list_events.dart';
import 'domain/use_case/cu_list_promos.dart';
import 'domain/use_case/user_use_case.dart';

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
                      collection: COLLECTION_EVENTS))
              )),
          ChangeNotifierProvider(
              create: (context) => PromoProvider(
                cuListPromos: CuListPromos(PromotionsMongodb())
              )),
          ChangeNotifierProvider(
              create: (context) => DiscoProvider(
                  cuListDisco: CuListDisco(DiscoMongodb(
                      connectionString: MONGO_URL,
                      collection: COLLECTION_DiSCO))
              )),
          ChangeNotifierProvider(
              create: (context) => UserProvider(
                  userUseCase: UserUseCase(UserMongodb(
                      connectionString: MONGO_URL,
                      collection: COLLECTION_USER))
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
