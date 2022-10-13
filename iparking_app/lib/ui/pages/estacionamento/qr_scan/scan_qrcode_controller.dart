import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/routes.dart';
import 'components/components.dart';

class ScarQrCodeScanController extends GetxController {
  final ticketCurrent = Rx<String?>(null);
  RotasSolicitacoes rotasSolicitacoes = RotasSolicitacoes();
  RotasEstacionamento estacionamento = RotasEstacionamento();
  RotasUsuario _rotasUsuario = RotasUsuario();

  loadTicket(String? value) async {
    if (value != null) {
      SolicitacoesEntity solicitacao =
          await rotasSolicitacoes.solicitacaoEspecifico(value);

      UsuarioEntity usuario =
          await _rotasUsuario.pegarUsuarioEspecifico(solicitacao.usuario!);
      var t = await Get.bottomSheet(
        BottomSheetParking(
          solicitacoes: solicitacao,
          usuario: usuario,
        ),
      );
      if (t != null) {
        SolicitacoesEntity solicitacao2 =
            await rotasSolicitacoes.fecharSolicitacao(value);
        await Get.bottomSheet(BottomSheetPayParking(
          solicitacoes: solicitacao2,
          usuario: usuario,
        ));
      }
    }
  }

  novoEstacionamento() async {}
}
