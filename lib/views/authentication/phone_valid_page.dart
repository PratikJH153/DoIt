import 'package:flutter/material.dart';

class PhoneValidPage extends StatelessWidget {
  static const routeName = "/phonevalid";
  const PhoneValidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PhoneValidPage"),
      ),
      body: const Center(
        child: Text("PhoneValidPage"),
      ),
    );
  }
}
