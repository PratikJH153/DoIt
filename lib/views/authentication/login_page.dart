import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:challengeapp/widgets/asking_user_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/top_intro_authentication.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xFF52bf92),
          onPressed: () {},
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
              Container(
                // padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF292929),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  autofocus: false,
                  validator: (val) {},
                  cursorColor: const Color(0xFFf2f4f9),
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      CupertinoIcons.device_phone_portrait,
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
                  label: "Don't have an account? ",
                  page: "Register.",
                  route: RegisterPage.routeName,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
