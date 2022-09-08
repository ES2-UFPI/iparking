import 'package:flutter/material.dart';

class CadastroVaga extends StatelessWidget {
  const CadastroVaga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Cadastrar Nova Vaga"),
            leading: IconButton(
              icon: const Icon(Icons.keyboard_return),
              onPressed: () => {},
            )),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Cadastro de Vaga",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Ativo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Checkbox(value: this.value,
                     onChanged: (bool value) {}
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Cadastrar"),
                )),
          ],
        ));
  }
}
