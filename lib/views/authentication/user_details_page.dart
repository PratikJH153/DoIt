import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  static const routeName = "/userdetails";
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserDetailsPage"),
      ),
      body: const Center(
        child: Text("UserDetailsPage"),
      ),
    );
  }
}
