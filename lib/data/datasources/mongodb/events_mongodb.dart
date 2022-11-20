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
}
