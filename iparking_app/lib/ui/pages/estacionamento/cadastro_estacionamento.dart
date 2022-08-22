import 'package:flutter/material.dart';

class CadastroEstacionamento extends StatelessWidget{

  const CadastroEstacionamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastrar Estacionamento"),  
      leading: IconButton(
        icon: const Icon(Icons.keyboard_return),
              onPressed: () => {},
              )),
      body: Column(children: [
        SizedBox(height: 10,),
        Text("Cadastro de Estacionamento", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 15,),
        TextField(
            obscureText: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Nome do Estacionamento",
            prefixIcon: Icon(Icons.person)
          )
        ),
        SizedBox(height: 15,),
        TextField(obscureText: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Email",
            prefixIcon: Icon(Icons.mail)
          )
        ),
        SizedBox(height: 15,),
        TextField(obscureText: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Endereço",
            prefixIcon: Icon(Icons.house)
          )
        ),
        SizedBox(height: 15,),
        TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Preço da Primeira Hora",
            prefixIcon: Icon(Icons.attach_money),
          )
        ),
        SizedBox(height: 15,),
        TextField(
            keyboardType: TextInputType.number,
            obscureText: false,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Preço da Hora Adicional",
            prefixIcon: Icon(Icons.attach_money)
          )
        ),
        SizedBox(height: 15,),
        TextButton(
                  onPressed: () { },
                  child: Align(alignment: Alignment.center,
                              child: Text("Cadastrar"),)),
      ],
      )
    );

  }
}