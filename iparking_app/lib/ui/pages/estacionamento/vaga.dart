import 'package:flutter/material.dart';

class Vaga extends StatelessWidget {
  final VagasEntity vaga;
  const Vaga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Vaga"),
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
              $(vaga.id),
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
