//import 'package:flutter/cupertino.dart';
import 'package:festa/domain/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../config/provider/event_provider.dart';

class EventsInCalendarScreen extends StatefulWidget {
  const EventsInCalendarScreen({Key? key}) : super(key: key);

  @override
  State<EventsInCalendarScreen> createState() => _EventsInCalendarScreen();
}

class _EventsInCalendarScreen extends State<EventsInCalendarScreen> {
  late final ValueNotifier<List<Evento>> _selectedEvents;
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Evento>? _eventsList;
  
  //---Formula genérica del calendario para filtrar eventos por dia
  List<Evento> _getEventsForDay(DateTime date) {
    // Implementation example
    // return kEvents[day] ?? [];
    List<Evento> eventsListByDay = [];
    for (var event in _eventsList!){
      if (event.fecha.day == date.day){
        eventsListByDay.add(event);
      }
    }
    return eventsListByDay;
  }
  
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
    // _selectedEvents = ValueNotifier(
    //     providerEventos.cuListEvents.getAllEvents() as List<Evento>);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eventos por calendario'),
          foregroundColor: const Color.fromARGB(255, 245, 244, 244),
          backgroundColor: const Color.fromARGB(255, 103, 58, 183),
        ),
        body: FutureBuilder<List<Evento>>(
          future: providerEventos.cuListEvents.getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _eventsList = snapshot.data;
              _selectedEvents = ValueNotifier(snapshot.data!);

              return content();
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
        )
        // body: content(),
        );
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  Widget content() {
    return Column(
      children: [
        Text(_selectedDay.toString().split(" ")[0]),
        TableCalendar(
          //---BASIC CONFIG
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          weekendDays: [6],
          //startingDayOfWeek: StartingDayOfWeek.monday,
          calendarFormat: _calendarFormat,

          //---SELECTED DAY
          availableGestures: AvailableGestures.horizontalSwipe,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: _onDaySelected,

          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          /*
          eventLoader: (day) {
            return _getEventsForDay(day);
          },
          */
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Evento>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${value[index]}'),
                      title: Text('${value[index]}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
