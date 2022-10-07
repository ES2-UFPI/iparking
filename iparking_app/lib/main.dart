import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iparking_app/ui/pages/pagamento/pagamento_main.dart';
import 'ui/pages/pages.dart';
import 'ui/themes/theme_light.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RealizarPagamento(),
    );
  }
}
