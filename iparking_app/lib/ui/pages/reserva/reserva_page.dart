import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/entities/entities.dart';
import '../../components/text/text.dart';

class ReservaPage extends StatelessWidget {
  final EstacionamentoEntity estacionamentoEntity;
  final SolicitacoesEntity solicitacoesEntity;
  const ReservaPage(
      {Key? key,
      required this.estacionamentoEntity,
      required this.solicitacoesEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              var uri = Uri.parse(
                  "google.navigation:q=${estacionamentoEntity.latitude},${estacionamentoEntity.longitude}&mode=d");
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not launch ${uri.toString()}';
              }
            },
            icon: const Icon(Icons.map),
            label: const Text("Localizar")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const Alignment(-0.8, 0.0),
                child: Text("QrCode",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 30),
              const Text("Na saída, apresente este QrCode!"),
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 200.0,
              ),
              const Divider(thickness: 6),
              const SizedBox(height: 30),
              Align(
                alignment: const Alignment(-0.8, 0.0),
                child: Text("Estadia",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              ParkingTitleAndBody(
                  title: "Inicio: ", body: DateTime.now().toString()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Divider(thickness: 6),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const Alignment(-0.8, 0.0),
                    child: Text("Parking",
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 300,
                    child: Stack(
                      children: [
                        Image.network(
                          estacionamentoEntity.image,
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
                          child: Text(estacionamentoEntity.nome,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Text(
                          estacionamentoEntity.endereco,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ), */
                        ParkingTitleAndBody(
                            title: "Primeira hora: ",
                            body:
                                "R\$ ${estacionamentoEntity.precoPrimeiraHora}"),
                        ParkingTitleAndBody(
                            title: "Adicional: ",
                            body:
                                "R\$ ${estacionamentoEntity.precoAdicionalHora}"),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: 'close');
                },
                child: Text("Cancelar Vaga"),
              )
            ],
          ),
        ));
  }
}
