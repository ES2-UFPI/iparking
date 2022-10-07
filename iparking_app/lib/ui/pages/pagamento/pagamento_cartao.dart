import 'package:flutter/material.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_confirmacacao.dart';

class PagamentoCartao extends StatelessWidget {
  const PagamentoCartao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Realizar Pagamento"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Número do Cartão",
                prefixIcon: Icon(Icons.credit_card)
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                labelText: "Nome do Titular",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "CVV",
                prefixIcon: Icon(Icons.person)
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Data de Vencimento",
                prefixIcon: Icon(Icons.calendar_view_day)
              ),
            ),
            SizedBox(height: 20,),
            OutlinedButton(
                  onPressed: () { 
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ConfirmarPagamento(pagamento_custo: 5.0, pagamento_tipo: "Cartão de Crédito",)));
                   },
                  child: Align(alignment: Alignment.center,
                              child: Text("Realizar Pagamento"),)),
        ],
        ));
  }
}
