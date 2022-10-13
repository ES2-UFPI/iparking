import 'package:checkmark/checkmark.dart';
import 'package:flutter/material.dart';

class PagamentoRealizado extends StatelessWidget {
  const PagamentoRealizado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pagamento Realizado")),
          body: Center(child: Column(children: [
                      SizedBox(height: 15,),
                      Text("Pagamento realizado com sucesso!"),
                      SizedBox(height: 15,),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: CheckMark(
                          active: true,
                          curve: Curves.decelerate,
                          duration: const Duration(milliseconds: 1000),
                        ),
                        ),
                       SizedBox(height: 25,), 
                       OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file,
                              size: 24.0,
                            ),
                            label: Text('Acessar Comprovante'),
                          ),
                    ],)
                )
        );
  }
}