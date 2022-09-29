import 'package:flutter/material.dart';

import 'cadastro_estacionamento_controler.dart';

class CadastroEstacionamento extends StatelessWidget {
  const CadastroEstacionamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CadastroEstacionamentoController controller =
        CadastroEstacionamentoController();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cadastro estacionamento"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Cadastre seu estacionamento e se torne parceiro do sistema Iparking, e aproveite recursos para ajudar em seu estabelecimento",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                    obscureText: false,
                    onChanged: controller.validadeName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome do Estacionamento",
                        prefixIcon: Icon(Icons.person))),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    obscureText: false,
                    onChanged: controller.validadeImage,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Link da imagem",
                        prefixIcon: Icon(Icons.photo))),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    obscureText: false,
                    onChanged: controller.validadeMail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        prefixIcon: Icon(Icons.mail))),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: false,
                  onChanged: controller.validadeLatitude,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Latitude",
                    prefixIcon: Icon(Icons.pin_drop_rounded),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: false,
                  onChanged: controller.validadeLongitude,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Longitude",
                    prefixIcon: Icon(Icons.pin_drop_rounded),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    onChanged: controller.validadeFistPrice,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Preço da Primeira Hora",
                      prefixIcon: Icon(Icons.attach_money),
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    onChanged: controller.validadePrice,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço da Hora Adicional",
                        prefixIcon: Icon(Icons.attach_money))),
                const SizedBox(height: 25),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: controller.cadastrar,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Cadastrar"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
