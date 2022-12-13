//import 'package:flutter/cupertino.dart';
import 'package:festa/domain/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../config/provider/event_provider.dart';
import 'event_details_screen.dart';

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

  ///Método utilizado por la función _onDaySelected para filtrar los eventos
  ///comparando su fecha y el dia seleccionado en el calendario.
  ///
  ///*Input: Dia a filtrar en formato DateTime
  ///
  ///*Return: Lista de eventos filtrados en formato List<Evento>
  List<Evento> _getEventsForDay(DateTime date) {
    List<Evento> eventsListByDay = [];
    if (_eventsList != null) {
      for (var event in _eventsList!) {
        if (event.fecha == date) {
          eventsListByDay.add(event);
        }
      }
    }
    return eventsListByDay;
  }

  ///Método utilizado en el handler del calendario "onDaySelected",
  ///y es usado para obtener el dia seleccionado y usar la función "_getEventsForDay"
  ///para filtrar los eventos.
  ///
  ///Este método actualiza el ValueNotifier _selectedEvents
  ///para actualizar en tiempo real la lista de eventos
  ///
  ///*INPUT*: dia seleccionado en formato DateTime
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
      print(_selectedEvents);
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerEventos = Provider.of<EventProvider>(context);
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
      ),
    );
  }

  ///Metodo utilizado para inicializar el ValueNotifier _selectedEvents
  ///Un ValueNotifier es una variable utilizada para hacer cambios
  ///en tiempo real dentro de la aplicación.
  ///Nuestro ValueNotifier es el encargado de mostrar los eventos
  ///para un dia seleccionado en el calendario y que esta lista
  ///se actualice
  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  ///Método utilizado para mostrar el calendario
  ///y para mostrar la lista de eventos en el dia seleccionado
  Widget content() {
    return Column(
      children: [
        //Text(_selectedDay.toString().split(" ")[0]),
        TableCalendar(
          //---BASIC CONFIG
          focusedDay: _focusedDay,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          weekendDays: [6],
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarFormat: _calendarFormat,

          //---Habilitador de gestos
          availableGestures: AvailableGestures.horizontalSwipe,

          //---SELECTED DAY
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

          //---Contador de eventos por dia
          eventLoader: (day) {
            return _getEventsForDay(day);
          },

          //Para cambiar los parametros de la parte superior
          headerStyle: const HeaderStyle(
            formatButtonShowsNext: false,
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
                      ///Cuando se le hace click al evento,
                      ///despliega una nueva ventana y
                      ///muestra la información del evento seleccionados
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EventDetailsScreen(value[index]),
                          ),
                        ),
                        print(value[index].nombre),
                      },
                      title: Text(value[index].nombre),
                      subtitle: Text(
                          'Fecha: ${value[index].fecha.year} - ${value[index].fecha.month} - ${value[index].fecha.day}'),
                      leading: Image.network(value[index].imagen),
                      trailing: const Icon(Icons.arrow_forward_rounded),
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
