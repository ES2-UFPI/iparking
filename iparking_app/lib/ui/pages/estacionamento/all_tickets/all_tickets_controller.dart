import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/routes.dart';

class AllTickectsController extends GetxController {
  final relatorioStream = Rx<List<SolicitacoesEntity>?>(null);

  RotasSolicitacoes _rotasSolicitacoes = RotasSolicitacoes();

  String idParking = "48a53e3c-15c8-4f61-a096-5b6d91ebd3ca";

  carregaSolicitacoes() async {
    relatorioStream.value =
        await _rotasSolicitacoes.listarSolicitacoesEstacionamento(idParking);
  }
}
