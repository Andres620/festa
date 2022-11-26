import 'package:flutter/material.dart';

import '../../domain/use_case/cu_list_disco.dart';

class DiscoProvider extends ChangeNotifier{
  final CuListDisco cuListDisco;
  DiscoProvider({required this.cuListDisco});
}