import 'package:flutter/material.dart';

import '../../data/entities/entities.dart';
import 'text/title_and_body.dart';

class EstacionamentoDetalhesBottomSheet extends StatelessWidget {
  final UsuarioEstacionamentoEntity estacionamento;
  const EstacionamentoDetalhesBottomSheet(
      {Key? key, required this.estacionamento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Stack(
                  children: [
                    Image.network(
                      estacionamento.image,
                      height: 300,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.all(24),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Text(estacionamento.nome,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    estacionamento.endereco,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  ParkingTitleAndBody(
                      title: "Primeira hora: ",
                      body: "R\$ ${estacionamento.precoPrimeiraHora}"),
                  ParkingTitleAndBody(
                      title: "Adicional: ",
                      body: "R\$ ${estacionamento.precoAdicionalHora}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Reservar"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
