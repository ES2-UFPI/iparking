import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iparking_app/utils/price_format.dart';

import '../../../../../data/entities/entities.dart';
import '../../../../../utils/date_format.dart';

class BottomSheetPayParking extends StatelessWidget {
  final SolicitacoesEntity solicitacoes;
  final UsuarioEntity usuario;
  const BottomSheetPayParking(
      {super.key, required this.solicitacoes, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
                    Text("Fim: ${dateFormate(solicitacoes.tempoFim ?? "")}"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Divider(),
                    ),
                    Text("Valor Total:"),
                    Text(formatPrice(solicitacoes.price ?? "0.0"),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
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
                          Get.back();
                        },
                        child: Text("Pago"))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
