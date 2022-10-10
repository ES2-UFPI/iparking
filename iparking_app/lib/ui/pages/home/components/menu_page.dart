import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../map_controller.dart';

class MenuPage extends StatelessWidget {
  final MapController controller;
  const MenuPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.local_parking_rounded,
                size: 60,
              ),
            ),
            SizedBox(height: 20),
            ParkinListTileOption(
              title: "Perfil",
              subtitle: "Verificar seus dados",
              icon: Icons.person,
              onTap: () {},
            ),
            ParkinListTileOption(
              title: "Pagamentos",
              subtitle: "Métodos de pagamentos",
              icon: Icons.credit_card,
              onTap: () {},
            ),
            ParkinListTileOption(
              title: "Tornar-se parceiro",
              subtitle:
                  "Cadastre seu estacionamento e aproveite recursos especiais",
              icon: Icons.local_parking_rounded,
              onTap: () async {
                await Get.toNamed('/parking/register');
                controller.reloadEstacionamento();
              },
            ),
            ParkinListTileOption(
              title: "Login Parking",
              subtitle: "Monitore seu estacionamento",
              icon: Icons.local_atm_rounded,
              onTap: () {
                Get.toNamed('/parking');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ParkinListTileOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function() onTap;
  final IconData icon;
  const ParkinListTileOption(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      subtitle:
          Text(subtitle ?? "", style: Theme.of(context).textTheme.labelMedium),
      leading: Icon(icon),
    );
  }
}
