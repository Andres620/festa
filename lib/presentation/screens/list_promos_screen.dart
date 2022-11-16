import 'package:flutter/material.dart';
import 'package:flutter_festa_proyect/config/provider/promo_provider.dart';
import 'package:flutter_festa_proyect/domain/models/promocion.dart';
import 'package:provider/provider.dart';

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
