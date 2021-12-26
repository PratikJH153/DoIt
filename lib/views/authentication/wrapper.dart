import 'package:challengeapp/database/auth.dart';
import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  static const routeName = "/";
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  AuthService _authService = AuthService();
  User? user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    User users = await _authService.getCurrentUser();
    setState(() {
      user = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return user!=null ? const HomePage() : LoginPage();
  }
}
