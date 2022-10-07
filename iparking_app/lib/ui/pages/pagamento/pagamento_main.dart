import 'package:flutter/material.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_cartao.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_dinheiro.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_pix.dart';
import 'package:pix_flutter/pix_flutter.dart';


class RealizarPagamento extends StatelessWidget {
  const RealizarPagamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Realizar Pagamento"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(height: 20,),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PagamentoCartao()));
            },
            icon: Icon(
              Icons.credit_card,
              size: 24.0,
            ),
            label: Text('Cartão de Crédito/Débito'),
          ),
          OutlinedButton.icon(
            onPressed: () {

                    PixFlutter pix_obj = PixFlutter(
                    payload: Payload(
                        pixKey: '5c96f3a3-0a98-4290-bf1d-e80d8e7c00b6',
                        description: 'Pagamento do Estacionamento',
                        merchantName: "Estacionas",
                        merchantCity: 'Teresina',
                        txid: "", // Até 25 caracteres para o QR Code estático
                        amount: 5.0.toString()
                      )
                    );

                    final String qr_code = pix_obj.getQRCode();

                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PagamentoPix(pix: qr_code)));
            },
            icon: Icon(
              Icons.pix,
              size: 24.0,
            ),
            label: Text('PIX'),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PagamentoDinheiro()));
            },
            icon: Icon(
              Icons.money,
              size: 24.0,
            ),
            label: Text('Em espécie'),
          )
        ],
        ));
  }
}
