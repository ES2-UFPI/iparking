import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Iparking"),
              SizedBox(height: 80),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text("email"),
                      ),
                    ),
                    TextFormField(),
                    OutlinedButton(onPressed: () {}, child: Text("Login"))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
