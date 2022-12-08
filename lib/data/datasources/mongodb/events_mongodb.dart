import 'dart:math';

import 'package:festa/domain/exceptions/app_exception.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../../../domain/models/evento.dart';
import '../../../domain/repositories/events_repository.dart';

/// Class that implements the events contract interacting with mongo atlas. 
class EventsMongodb extends EventsRepository {
  final String connectionString;
  final String collection;

  EventsMongodb({required this.connectionString, required this.collection});

  @override
  Future<List<Evento>> getEvents() async {
    try {
      List<Evento> eventsList = [];
      var db = await Db.create(connectionString);
      await db.open();
      var eventsResponse =
          await db.collection(collection).find().toList();

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


  ///Returns a random event from the database.
  ///This is used to send notifications to users.
  @override
  Future<Evento> getARandomEvent() async {
    try {
      Evento event;
      var db = await Db.create(connectionString);
      await db.open();
      var eventsResponse =
          await db.collection(collection).find().toList();
      var random = Random().nextInt(eventsResponse.length);
      event = Evento.fromJson(eventsResponse[random]);
      db.close();
      return event;
    } catch (e) {
      throw AppException(
          errorMessage:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
  
  @override
  Future<List<Evento>> getEventsByDisco(ObjectId? discoId) async{
    try {
      List<Evento> eventsList = [];
      var db = await Db.create(connectionString);
      await db.open();
      var eventsResponse =
          await db.collection(collection).find(where.eq("Discoteca", discoId)).toList();

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
}
