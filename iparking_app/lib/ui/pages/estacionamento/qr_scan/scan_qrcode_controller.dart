import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/routes.dart';

class ScarQrCodeScanController extends GetxController {
  final ticketCurrent = Rx<String?>(null);
  RotasSolicitacoes rotasSolicitacoes = RotasSolicitacoes();

  loadTicket(String? value) async {
    if (value != null) {
      List<SolicitacoesEntity> solicitacao =
          await rotasSolicitacoes.listarSolicitacoes("0", "0");

      print(solicitacao.length);
    }
  }
}
