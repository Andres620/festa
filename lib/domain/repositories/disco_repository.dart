import '../models/discoteca.dart';

abstract class DiscoRepository{
  Future<List<Discoteca>> getEvents();
}