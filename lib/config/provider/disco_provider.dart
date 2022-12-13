import 'package:flutter/material.dart';

import '../../domain/use_case/cu_list_disco.dart';

/// Class that manages dependency injection for Disco.
class DiscoProvider extends ChangeNotifier{
  final CuListDisco cuListDisco;
  DiscoProvider({required this.cuListDisco});
}