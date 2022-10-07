import 'package:flutter/material.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_confirmacacao.dart';
import 'package:pix_flutter/pix_flutter.dart';
import 'package:flutter/services.dart';

class PagamentoPix extends StatelessWidget {
  final String pix;

  const PagamentoPix({Key? key, required this.pix}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Realizar Pagamento"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Center(child: Column(children: [
                 Text("Pagamento por PIX"),
                 SizedBox(height: 20,),
                 Image.asset("lib/ui/assets/imgs/logo-pix-icone-256.png"), 
                 SizedBox(height: 20,),
                 Text(pix),
                 SizedBox(height: 20,),
                 OutlinedButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: pix));
                    },
                    icon: Icon(
                      Icons.folder_copy,
                      size: 24.0,
                    ),
                    label: Text('Copiar'),
                  ),
                 SizedBox(height: 20,),
                 Text("Utilize o código acima para pagar no seu aplicativo de preferência."),
              ]),)
          ],
        ));
  }
}
