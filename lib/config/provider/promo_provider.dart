import 'package:flutter/material.dart';

import '../../domain/use_case/cu_list_promos.dart';

/// Class that manages dependency injection for Promotions.
class PromoProvider extends ChangeNotifier {
  final CuListPromos cuListPromos;
  PromoProvider({required this.cuListPromos});
}
