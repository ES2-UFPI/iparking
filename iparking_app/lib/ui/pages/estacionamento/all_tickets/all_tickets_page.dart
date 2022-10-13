import 'package:flutter/material.dart';
import 'package:iparking_app/utils/date_format.dart';
import 'package:iparking_app/utils/price_format.dart';

import '../../../../data/entities/entities.dart';
import 'all_tickets_controller.dart';

class AllTicketsPage extends StatelessWidget {
  const AllTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllTickectsController controller = AllTickectsController();
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        controller.carregaSolicitacoes();
        return StreamBuilder<List<SolicitacoesEntity>?>(
            stream: controller.relatorioStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text(
                                formatPrice(snapshot.data![index].price ?? "")),
                            subtitle: Row(
                              children: [
                                Text(dateFormate(
                                    snapshot.data![index].tempoInicio)),
                              ],
                            )),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      }),
    );
  }
}
