import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RegisterPage"),
      ),
      body: const Center(
        child: Text("RegisterPage"),
      ),
    );
  }
}
