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
      body:   FutureBuilder<List<Promocion>>(
                future: providerPromociones.cuListPromos.getAllPromos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          Promocion promotion = snapshot.data![index];
                          return _buidCards(promotion);
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

  Widget _buidCards(Promocion promo) {
    return Container(
        clipBehavior: Clip.none,
        height: 80,
        child: Card(
            color: const Color.fromARGB(250, 72, 72, 72),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.all(8),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  promo.descripcion,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 235, 238, 39)),
                ),
                Text(
                  'Válido hasta: ${promo.fechaInicio.year} - ${promo.fechaInicio.month} - ${promo.fechaInicio.day}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 219, 177, 9)),
                )
              ],
            )));
  }
}
