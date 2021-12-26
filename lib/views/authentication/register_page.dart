import 'dart:io';

import 'package:challengeapp/database/auth.dart';
import 'package:challengeapp/database/database.dart';
import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/authentication/user_details_page.dart';
import 'package:challengeapp/widgets/asking_user_authentication.dart';
import 'package:challengeapp/widgets/top_intro_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF52bf92),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => UserDetailsPage(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            ),
          ),
          label: Row(
            children: const [
              Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              Text(
                "Next",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 32,
            right: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 120,
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/logo2.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              topIntroAuthenticate(
                context: context,
                des1: "Let's Do It,",
                des2: "Challenge Yourself.",
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF292929),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _emailController,
                  autofocus: false,
                  validator: (val) {},
                  cursorColor: const Color(0xFFf2f4f9),
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 20,
                      color: Color(0xFFf2f4f9),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                ),
              ),
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF292929),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  autofocus: false,
                  validator: (val) {},
                  cursorColor: const Color(0xFFf2f4f9),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.lock,
                      size: 20,
                      color: Color(0xFFf2f4f9),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: askingUserAuthenticate(
                  context: context,
                  label: "Already have an account? ",
                  page: "Login Here.",
                  route: LoginPage(),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
