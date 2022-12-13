import 'package:festa/domain/models/promocion.dart';
import 'package:festa/presentation/screens/list_promotions_by_disco_screen.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/widgets/basic.dart' as Center;

import '../../config/provider/event_provider.dart';
import '../../domain/models/discoteca.dart';
import '../../domain/models/evento.dart';
import 'list_events_by_disco_screen.dart';

class PromotionDetailsScreen extends StatelessWidget {
  final Promocion promotion;
  const PromotionDetailsScreen(this.promotion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Promocion"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.network(
                  promotion.imagen,
                  height: 500,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Válido hasta: ${promotion.fechaFin.year} - ${promotion.fechaFin.month} - ${promotion.fechaFin.day}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 19.0),
                  ),
                )
              ])),
        ));
  }
}
