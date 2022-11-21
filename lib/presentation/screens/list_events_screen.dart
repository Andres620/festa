// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:festa/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/provider/event_provider.dart';
import '../../domain/models/evento.dart';
import '../../services/local_notifications_service.dart';
import 'list_promos_screen.dart';

class ListEventsScreen extends StatefulWidget {
  const ListEventsScreen({Key? key}): super(key: key);

  @override
  State<ListEventsScreen> createState() => _ListEventsScreenState();
}

class _ListEventsScreenState extends State<ListEventsScreen> {
  
  @override
  void initState() {
    initialize();
    listenToNotification();
    super.initState();
  }

  int _actualPage = 0;
  List<Widget> _pages = [
    HomePage(),
    ListPromocionesScreen()
  ];
  ///Is the main method of the view and is responsible for displaying the information of each event.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
            title: const Text('Eventos'),
            backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
        // drawer: Drawer(
        //   child: Column(
        //       children: [const Text("Opcion 1"), const Text("Opcion 2")]),
        // ),
        body: _pages[_actualPage],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              _actualPage = index;
            });
          },
          currentIndex: _actualPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "promotions"),
            BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "event_club")
          ],
        ),);
  }


  void listenToNotification() =>
      onNotificationClick.stream.listen(onNoticationListener);

  /// It loads the notification payload and sends it to a second view.
  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => SecondScreen(payload: payload))));
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    return Scaffold(
      body:   FutureBuilder<List<Evento>>(
                future: providerEventos.cuListEvents.getAllEvents(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          Evento event = snapshot.data![index];
                          return _buidCards(event);
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
              ),
    );
  }
  
/// Builds the structure to display the information of an event.
  Widget _buidCards(Evento evento) {
    return Container(
        clipBehavior: Clip.none,
        height: 80,
        child: Card(
            color: const Color.fromARGB(250, 72, 72, 72),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.all(8),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  evento.nombre,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 235, 238, 39)),
                ),
                Text(
                  evento.tipo,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 211, 210, 208)),
                ),
                Text(
                  '${evento.fecha.year} - ${evento.fecha.month} - ${evento.fecha.day}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 219, 177, 9)),
                )
              ],
            )));
  }
}
