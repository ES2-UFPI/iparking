import 'package:get/get.dart';

import '../../../../data/entities/entities.dart';
import '../../../../data/routes/routes.dart';

class MenuController extends GetxController {
  final _rxUsuario = Rx<UsuarioEntity?>(null);
  final RotasUsuario rotasUsuario = RotasUsuario();

  Future<void> carregarUsuario() async {
    _rxUsuario.value = await rotasUsuario.pegarUsuarioEspecifico('1');
  }
}
