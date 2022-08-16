import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget{

  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("iParking"),  
      leading: IconButton(
        icon: const Icon(Icons.person),
              onPressed: () => {},
              )),
      body: Column(children: [
        TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Para onde deseja ir?",
            prefixIcon: Icon(Icons.search_outlined)
          ),
        )
      ],
      )
    );

  }
}