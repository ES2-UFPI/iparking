import 'dart:math';

import 'package:get/get.dart';

class TesteValidadeInformacoes{
  String? num_cartao_de_credito;
  String? cvv;
  String? titular;
  String? data_vencimento;
  bool? valido;

  TesteValidadeInformacoes(String? num_cartao_de_credito, String? cvv, String? titular, String? data_vencimento){
    
    this.num_cartao_de_credito = num_cartao_de_credito;
    this.cvv = cvv;
    this.titular = titular;
    this.data_vencimento = data_vencimento;

  }

  void realizar_teste(){
    this.valido = true;

    if(num_cartao_de_credito?.length != 16){
      this.valido = false;
    }

    if(cvv != 3){
      this.valido = false;
    }

    if (double.tryParse(titular.toString()) != null){
      this.valido = false;
    }

    if (data_vencimento?.length != 5){
      this.valido = false;
    }

  }
}