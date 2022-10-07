import 'package:flutter/material.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_finalizado.dart';

class ConfirmarPagamento extends StatelessWidget {

  final String pagamento_tipo;
  final double pagamento_custo;

  const ConfirmarPagamento({Key? key, required this.pagamento_tipo, required this.pagamento_custo}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirmar Pagamento"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(height: 25,),
          Text("Método de Pagamento: " + pagamento_tipo),
          Text("Total: R\$ " + pagamento_custo.toString()),
          SizedBox(height: 80,),
          OutlinedButton(
                  onPressed: () { 
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const PagamentoRealizado()));
                   },
                  child: Align(alignment: Alignment.center,
                              child: Text("Realizar Pagamento"),)),
        ],
        ));
  }
}