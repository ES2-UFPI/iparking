import 'package:flutter/material.dart';

class CadastroEstacionamento extends StatelessWidget {
  const CadastroEstacionamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Cadastrar Estacionamento"),
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
              "Cadastro de Estacionamento",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nome do Estacionamento",
                    prefixIcon: Icon(Icons.person))),
            const SizedBox(
              height: 15,
            ),
            const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    prefixIcon: Icon(Icons.mail))),
            const SizedBox(
              height: 15,
            ),
            const TextField(
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Endereço",
                    prefixIcon: Icon(Icons.house))),
            const SizedBox(
              height: 15,
            ),
            const TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Preço da Primeira Hora",
                  prefixIcon: Icon(Icons.attach_money),
                )),
            const SizedBox(
              height: 15,
            ),
            const TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Preço da Hora Adicional",
                    prefixIcon: Icon(Icons.attach_money))),
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
