import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/pages/pages.dart';
import 'ui/themes/theme_light.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: makeThemeLight(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/flow",
      getPages: [
        GetPage(name: '/flow', page: () => const FlowPage()),
        GetPage(name: "/map", page: () => const HomePage()),
        GetPage(
            name: "/parking/register", page: () => CadastroEstacionamento()),
        GetPage(
            name: "/estacionamento/home",
            page: () => const HomeEstacionamentoPage()),
        GetPage(name: "/estacionamento/qrscan", page: () => const QRViewPage()),
      ],
    );
  }
}
