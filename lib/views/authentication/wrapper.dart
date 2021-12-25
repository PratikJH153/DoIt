import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  static const routeName = "/";
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final bool _isAuthenticated = true;

  @override
  Widget build(BuildContext context) {
    return _isAuthenticated ? const HomePage() : const LoginPage();
  }
}
