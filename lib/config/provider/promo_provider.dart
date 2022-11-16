import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/domain/use_case/cu_list_promos.dart';

class PromoProvider extends ChangeNotifier {
  final CuListPromos cuListPromos;
  PromoProvider({required this.cuListPromos});
}
