import 'dart:developer';
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
      var events_response =
          await db.collection(COLLECTION_EVENTS).find().toList();

      events_response
          .forEach((event_map) => {eventsList.add(Evento.fromJson(event_map))});
      return eventsList;
    } catch (e) {
      throw AppException(
          error_message:
              'Failed to establish connection with data repository. ${e.toString()}');
    }
  }
}
