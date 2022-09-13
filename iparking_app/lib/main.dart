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
      initialRoute: "/map",
      getPages: [
        GetPage(name: "/map", page: () => const HomePage()),
        GetPage(
            name: "/parking/register", page: () => CadastroEstacionamento()),
      ],
    );
  }
}
