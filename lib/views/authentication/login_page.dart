import 'package:challengeapp/database/auth.dart';
import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:challengeapp/views/home.dart';
import 'package:challengeapp/widgets/asking_user_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/top_intro_authentication.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthService _authService = AuthService();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      await _authService
          .loginWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        context,
      )
          .then((User user) async {
        if (user != null) {
          print("USER NO NULL");

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (Route<dynamic> route) => false,
          );
        } else {
          print("USER NULLLLL I THINK NOT FOUND");
        }
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: isLoading
            ? CircularProgressIndicator()
            : FloatingActionButton.extended(
                backgroundColor: const Color(0xFF52bf92),
                onPressed: _login,
                label: Row(
                  children: const [
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Let's go!",
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
                des1: "Welcome back.",
                des2: "You've been missed!",
              ),
              const SizedBox(
                height: 35,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
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
                          obscureText: true,
                          validator: (val) {},
                          cursorColor: const Color(0xFFf2f4f9),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              CupertinoIcons.lock,
                              size: 20,
                              color: Color(0xFFf2f4f9),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: askingUserAuthenticate(
                  context: context,
                  label: "Don't have an account? ",
                  page: "Register.",
                  route: const RegisterPage(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
