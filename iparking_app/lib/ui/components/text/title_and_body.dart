import 'package:flutter/material.dart';

class ParkingTitleAndBody extends StatelessWidget {
  final String title;
  final String body;
  const ParkingTitleAndBody({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600)),
      TextSpan(text: body, style: const TextStyle(color: Colors.black)),
    ]));
  }
}
