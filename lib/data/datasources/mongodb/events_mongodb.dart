import 'dart:math';

import 'package:festa/domain/exceptions/app_exception.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../domain/models/evento.dart';
import '../../../domain/repositories/events_repository.dart';
import 'credentials.dart';

class EventsMongodb extends EventsRepository {
  @override
  Future<List<Evento>> getEvents() async {
    try {
      List<Evento> eventsList = [];
      var db = await Db.create(MONGO_URL);
      await db.open();
      var eventsResponse =
          await db.collection(COLLECTION_EVENTS).find().toList();

      for (var eventMap in eventsResponse) {
        eventsList.add(Evento.fromJson(eventMap));
      }
      db.close();
      return eventsList;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }


  @override
  Future<Evento> getARandomEvent() async {
    try {
      Evento event;
      var db = await Db.create(MONGO_URL);
      await db.open();
      var eventsResponse =
          await db.collection(COLLECTION_EVENTS).find().toList();
      var random = Random().nextInt(eventsResponse.length);
      print(random);
      event = Evento.fromJson(eventsResponse[random]);
      db.close();
      print(event.nombre);
      return event;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
}
