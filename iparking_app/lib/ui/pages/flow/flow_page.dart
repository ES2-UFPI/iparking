import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlowPage extends StatelessWidget {
  const FlowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text("Selecione seu tipo de usuario",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  textAlign: TextAlign.center),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.offNamed('/map');
                      },
                      icon: Icon(Icons.account_circle, size: 70),
                    ),
                    Text("Pessoal")
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.offNamed('/estacionamento/home');
                        },
                        icon: Icon(Icons.local_parking_outlined, size: 70)),
                    Text("Estacionamento")
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
