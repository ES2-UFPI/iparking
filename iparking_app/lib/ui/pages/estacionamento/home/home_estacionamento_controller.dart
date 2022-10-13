import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/rotas_relatorios.dart';

class HomeEstacionamentoControler extends GetxController {
  final relatorioStream = Rx<RelatorioEntity?>(null);

  RotasRelatorios _rotasRelatorios = RotasRelatorios();

  String idParking = "48a53e3c-15c8-4f61-a096-5b6d91ebd3ca";

  carregaRelatorio() async {
    relatorioStream.value =
        await _rotasRelatorios.relatorioSolicitacoes(idParking);
  }
}
