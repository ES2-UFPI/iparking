import 'package:flutter/material.dart';

import '../../data/entities/entities.dart';

class EstacionamentoDetalhesBottomSheet extends StatelessWidget {
  final UsuarioEstacionamentoEntity estacionamento;
  const EstacionamentoDetalhesBottomSheet(
      {Key? key, required this.estacionamento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Image.network(
                  'https://cdn.autopapo.com.br/box/uploads/2020/10/08100003/estacionamento-de-shopping-carros-automoveis-parando-pessoas-andando-regras-transito.jpg',
                  height: 300,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.all(24),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
        ],
      ),
    );
  }
}
