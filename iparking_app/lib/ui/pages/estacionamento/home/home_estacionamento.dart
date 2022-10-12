import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeEstacionamentoPage extends StatelessWidget {
  const HomeEstacionamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Bem vindo usuario"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/estacionamento/qrscan');
        },
        child: Icon(Icons.qr_code_scanner_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Text("data"),
            )
          ],
        ),
      ),
    );
  }
}
