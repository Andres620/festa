// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:festa/presentation/screens/events_in_calendar.dart';
import 'package:festa/presentation/screens/notification_info_screen.dart';
import 'package:flutter/material.dart';
import '../../services/local_notifications_service.dart';
import 'list_discos_screen.dart';
import 'list_events_screen.dart';
import 'list_promos_screen.dart';
import 'user_levels_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initialize();
    listenToNotification();
    super.initState();
  }

  int _actualPage = 0;
  List<Widget> _pages = [
    ListEventsScreen(),
    ListPromocionesScreen(),
    ListDiscosScreen(),
    UserLevelScreen(),
    EventsInCalendarScreen()
  ];
  ///Is the main method of the view and is responsible for displaying the information of each event.
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        // drawer: Drawer(
        //   child: Column(
        //       children: [const Text("Opcion 1"), const Text("Opcion 2")]),
        // ),
        body: _pages[_actualPage],
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
          unselectedItemColor: Colors.white,
          onTap: (index){
            setState(() {
              _actualPage = index;
            });
          },
          currentIndex: _actualPage,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Eventos", backgroundColor: Color.fromARGB(255, 103, 58, 183)),
            BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: "Promociones", backgroundColor: Color.fromARGB(255, 103, 58, 183)),
            BottomNavigationBarItem(icon: Icon(Icons.rocket_launch), label: "Discotecas", backgroundColor: Color.fromARGB(225, 103, 58, 183)),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Usuario", backgroundColor: Color.fromARGB(255, 103, 58, 183)),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendario", backgroundColor: Color.fromARGB(255, 103, 58, 183))
          ],
        ),);
  }


  void listenToNotification() =>
      onNotificationClick.stream.listen(onNoticationListener);

  /// It loads the notification payload and sends it to a second view.
  void onNoticationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => NotificationInfoScreen(payload: payload))));
    }
  }
}
