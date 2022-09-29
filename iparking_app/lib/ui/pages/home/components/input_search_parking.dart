import 'package:flutter/material.dart';

import '../map_controller.dart';

class InputSearchParking extends StatelessWidget {
  final MapController controller;
  const InputSearchParking({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: controller.isSearching.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return SizedBox();
          }
          return Align(
              alignment: const Alignment(0.0, -0.8),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        hintText: "Pesquisar..."),
                  ),
                ),
              ));
        });
  }
}
