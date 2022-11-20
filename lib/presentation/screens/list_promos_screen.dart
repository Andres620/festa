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
        appBar: AppBar(title: const Text('PROMOCIONES')),
        body: FutureBuilder<List<Promocion>>(
          future: providerPromociones.cuListPromos.getAllPromos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    Promocion promocion = snapshot.data![index];
                    return Text(promocion.descripcion);
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
        ));
  }
}
