import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iparking_app/data/entities/entities.dart';
import 'package:iparking_app/utils/price_format.dart';

import 'home_estacionamento_controller.dart';

class HomeEstacionamentoPage extends StatelessWidget {
  const HomeEstacionamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeEstacionamentoControler controller = HomeEstacionamentoControler();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Bem vindo usuario"),
        actions: [
          IconButton(
              onPressed: () {
                controller.carregaRelatorio();
              },
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/estacionamento/qrscan');
        },
        child: Icon(Icons.qr_code_scanner_rounded),
      ),
      body: Builder(builder: (context) {
        controller.carregaRelatorio();
        return SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (() => Get.toNamed("/estacionamento/tickets")),
                child: CurrentData(
                  controler: controller,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class CurrentData extends StatefulWidget {
  final HomeEstacionamentoControler controler;
  const CurrentData({Key? key, required this.controler}) : super(key: key);

  @override
  State<CurrentData> createState() => _CurrentDataState();
}

class _CurrentDataState extends State<CurrentData> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RelatorioEntity?>(
        stream: widget.controler.relatorioStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total mensal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text(
                      formatPrice(
                        snapshot.data!.totalPrice.toString(),
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.green),
                    ),
                    Divider(),
                    Text("reservas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("totais: ${snapshot.data!.countCurrent}"),
                        Text("fechadas: ${snapshot.data!.countCloset}"),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
