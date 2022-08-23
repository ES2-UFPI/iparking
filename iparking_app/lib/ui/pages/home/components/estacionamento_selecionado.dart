import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iparking_app/ui/pages/pages.dart';

import '../../../../data/entities/entities.dart';
import '../map_controller.dart';

class FloatEstacionamentoSelecionado extends StatelessWidget {
  final MapController controller;
  const FloatEstacionamentoSelecionado({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EstacionamentoEntity?>(
        stream: controller.estacionamentoSelecionado.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Get.to(ReservaPage(estacionamentoEntity: snapshot.data!),
                    fullscreenDialog: true);
              },
              child: SizedBox(
                width: 300,
                height: 60,
                child: Card(
                  color:
                      const Color.fromARGB(255, 101, 179, 104).withOpacity(0.9),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(snapshot.data!.image),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(snapshot.data!.nome),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
