import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/routes.dart';

class UpdateVagasController extends GetxController {
  final estacionamentoStream = Rx<EstacionamentoEntity?>(null);

  RotasEstacionamento _rotasSolicitacoes = RotasEstacionamento();

  String idParking = "48a53e3c-15c8-4f61-a096-5b6d91ebd3ca";

  carregarEstacionamento() async {
    estacionamentoStream.value =
        await _rotasSolicitacoes.estacionamentoEspecifico(idParking);
  }

  atualizarVagas(String vagas) async {
    await _rotasSolicitacoes.updateVagas(idParking, int.parse(vagas));
    carregarEstacionamento();
  }
}
