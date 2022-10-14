import 'package:flutter/material.dart';
import 'package:iparking_app/data/entities/entities.dart';

import 'update_vagas_controller.dart';

class UpdateVagasPage extends StatefulWidget {
  const UpdateVagasPage({super.key});

  @override
  State<UpdateVagasPage> createState() => _UpdateVagasPageState();
}

class _UpdateVagasPageState extends State<UpdateVagasPage> {
  UpdateVagasController controller = UpdateVagasController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        controller.carregarEstacionamento();
        return SingleChildScrollView(
            child: Column(
          children: [
            StreamBuilder<EstacionamentoEntity?>(
                stream: controller.estacionamentoStream.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    textEditingController.text =
                        snapshot.data!.parkingSpaces.toString();
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(snapshot.data!.nome),
                            SizedBox(height: 30),
                            Text(
                                "Vagas Atuais: ${snapshot.data!.parkingSpaces}"),
                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: textEditingController,
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                controller
                                    .atualizarVagas(textEditingController.text);
                              },
                              child: Text("Confirmar"),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
      }),
    );
  }
}
