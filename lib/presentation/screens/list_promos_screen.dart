import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/provider/promo_provider.dart';
import '../../domain/models/promocion.dart';

class ListPromocionesScreen extends StatelessWidget {
  const ListPromocionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPromociones = Provider.of<PromoProvider>(context);
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/img1.jpg"), fit: BoxFit.cover)),
            child: Scaffold(
                appBar: AppBar(
                    title: const Text(
                      "Promociones",
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 248, 248, 248)),
                    ),
                    backgroundColor: Color.fromARGB(255, 23, 22, 22)),
                body: FutureBuilder<List<Promocion>>(
                  future: providerPromociones.cuListPromos.getAllPromos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            Promocion promocion = snapshot.data![index];
                            return _buidCards(promocion);
                          }));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.hasError}');
                    }
                    return const Center(
                        child: SizedBox(
                      width: .5,
                      height: .5,
                      child: CircularProgressIndicator(),
                    ));
                  },
                ))));
  }

  Widget _buidCards(Promocion promo) {
    return Container(
        clipBehavior: Clip.none,
        height: 100,
        child: Card(
            color: const Color.fromARGB(252, 0, 0, 0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.all(8),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  promo.imagen,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 190, 190, 6)),
                ),
                Text(
                  promo.descripcion,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 202, 219, 8)),
                ),
                Text(
                  '${promo.fechaInicio} - ${promo.fechaFin}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 245, 237, 8)),
                ),
              ],
            )));
  }
}
