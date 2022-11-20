import 'package:festa/data/datasources/mongodb/credentials.dart';
import 'package:festa/data/datasources/mongodb/events_mongodb.dart';
import 'package:festa/data/datasources/test_local/Event/eventsdb_fake.dart';
import 'package:festa/domain/exceptions/app_exception.dart';
import 'package:festa/domain/models/evento.dart';
import 'package:festa/domain/use_case/cu_list_events.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Make a query to the fake repository from domain layer and gets data',
      () async {
    CuListEvents cuListEvents = CuListEvents(EventsdbFake(4));
    var response = await cuListEvents.getAllEvents();
    expect(response.isNotEmpty, true);
  });

  test('Make a query to the fake repository from domain layer and gets no data',
      () async {
    var cuListEvents = CuListEvents(EventsdbFake(0));
    expect(
        () async => await cuListEvents.getAllEvents(),
        throwsA(
          (e) => e is AppException,
        ));
  });

  test(
      'Makes a query to the mongo atlas repository with correct credentials from the data layer and gets the data.',
      () async {
    EventsMongodb eventsMongodb = EventsMongodb(
        connectionString: MONGO_URL, collection: COLLECTION_EVENTS);
    var response = await eventsMongodb.getEvents();
    expect(response.isNotEmpty, true);
  });

  test(
      'Makes a query to the mongo atlas repository without correct credentials from the data layer and gets the data.',
      () async {
    EventsMongodb eventsMongodb = EventsMongodb(
        connectionString: 'mongodb+srv://badconectionString',
        collection: COLLECTION_EVENTS);
    expect(() async => await eventsMongodb.getEvents(),
        throwsA((e) => e is AppException));
  });

  
  test('get a random event', () async {
    var eventdb = EventsMongodb(connectionString: MONGO_URL, collection: COLLECTION_EVENTS);
    var response = await eventdb.getARandomEvent() ;
    expect(response, isA<Evento>());
  });
}
