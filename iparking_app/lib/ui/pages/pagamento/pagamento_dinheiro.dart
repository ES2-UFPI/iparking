import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';

class PagamentoDinheiro extends StatelessWidget {
  const PagamentoDinheiro ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagamento em Espécie")),
          body: Center(child: Column(children: [
                      SizedBox(height: 20,),
                      Image.asset("lib/ui/assets/imgs/atm.png"), 
                      SizedBox(height: 20,),
                      Text("Para realizar o pagamento em espécie, dirija-se a um dos terminais de pagamento ou à recepção do estacionamento."),
                      ],)
                )
        );
  }
}