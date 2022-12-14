import 'package:festa/domain/models/promocion.dart';
import 'package:flutter/material.dart';

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
                    style: const TextStyle(fontSize: 19.0),
                  ),
                )
              ])),
        ));
  }
}
