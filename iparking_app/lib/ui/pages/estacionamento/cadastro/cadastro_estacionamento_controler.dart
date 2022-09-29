import 'package:get/get.dart';

import '../../../../data/routes/routes.dart';

class CadastroEstacionamentoController extends GetxController {
  final RotasEstacionamento estacionamento = RotasEstacionamento();

  String name = "";
  String mail = '';
  String imageUrl = '';
  String phone = '';
  double price = 0.0;
  double firstPrice = 0.0;
  int parkingSpaces = 0;
  String latitude = '';
  String longitude = '';

  void validadeName(String? value) {
    this.name = value ?? "";
  }

  void validadeMail(String? value) {
    this.mail = value ?? "";
  }

  void validadeImage(String? value) {
    this.imageUrl = value ?? "";
  }

  void validadePhone(String? value) {
    this.phone = value ?? "";
  }

  void validadePrice(String? value) {
    this.price = double.tryParse(value ?? "") ?? 0.0;
    ;
  }

  void validadeFistPrice(String? value) {
    this.firstPrice = double.tryParse(value ?? "") ?? 0.0;
  }

  void validadeLatitude(String? value) {
    this.latitude = value ?? "";
  }

  void validadeLongitude(String? value) {
    this.longitude = value ?? "";
  }

  void validadeVagas(int value) {
    this.parkingSpaces = value;
  }

  void cadastrar() {
    estacionamento.cadastrarEstacionameto(EstacionamentoParams(
        nome: name,
        image: imageUrl,
        fone: phone,
        email: mail,
        latitude: latitude,
        longitude: longitude,
        precoPrimeiraHora: firstPrice,
        precoAdicionalHora: price,
        parkingSpaces: parkingSpaces));
  }
}
