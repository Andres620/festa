import '../models/evento.dart';

abstract class EventosPorDiscotecaRepository {
  String idDiscoteca;
  EventosPorDiscotecaRepository({required this.idDiscoteca});

  Future<List<Evento>> getEventosPorDiscoteca();
  //Future<Usuario?> getUser({String id});
  //Future<void> insertUser(Usuario user);
  //Future<void> updateUser(Usuario user);
  // Future<void> delete(String id);
}
