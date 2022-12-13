import 'package:festa/presentation/screens/promotion_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/provider/promo_provider.dart';
import '../../domain/models/promocion.dart';

class ListPromocionesScreen extends StatelessWidget {
  const ListPromocionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPromociones = Provider.of<PromoProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Promociones'),
          foregroundColor: const Color.fromARGB(255, 245, 244, 244),
          backgroundColor: const Color.fromARGB(255, 103, 58, 183)),
      body: FutureBuilder<List<Promocion>>(
        future: providerPromociones.cuListPromos.getAllPromos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  Promocion promotion = snapshot.data![index];
                  return _buidCards(promotion, context);
                }));
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buidCards(Promocion promotion, context) {
    return InkWell(
        child: Card(
            child: ListTile(
                title: Text(promotion.descripcion),
                subtitle: Text(
                    'Válido hasta: ${promotion.fechaFin.year} - ${promotion.fechaFin.month} - ${promotion.fechaFin.day}'),
                leading: Image.network(promotion.imagen),
                trailing: const Icon(Icons.arrow_forward_rounded))),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PromotionDetailsScreen(promotion)));
        });
  }
}
