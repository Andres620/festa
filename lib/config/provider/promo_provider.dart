import 'package:flutter/material.dart';
import 'package:festa/domain/use_case/cu_list_promos.dart';

class PromoProvider extends ChangeNotifier {
  final CuListPromos cuListPromos;
  PromoProvider({required this.cuListPromos});
}
