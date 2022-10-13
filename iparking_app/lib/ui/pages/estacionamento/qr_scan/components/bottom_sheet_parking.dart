import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/entities/entities.dart';
import '../../../../../utils/date_format.dart';

class BottomSheetParking extends StatelessWidget {
  final SolicitacoesEntity solicitacoes;
  final UsuarioEntity usuario;
  const BottomSheetParking(
      {super.key, required this.solicitacoes, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cliente: ${usuario.nome}"),
                    Text("Email: ${usuario.email}"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Divider(),
                    ),
                    Text("Inicio: ${dateFormate(solicitacoes.tempoInicio)}"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancelar")),
                    ElevatedButton(
                        onPressed: () {
                          Get.back(result: "finalizar");
                        },
                        child: Text("Finalizar"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
