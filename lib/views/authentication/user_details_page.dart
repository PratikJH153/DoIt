import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:challengeapp/widgets/asking_user_authentication.dart';
import 'package:challengeapp/widgets/top_intro_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  static const routeName = "/userdetails";
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
              top: 70,
              left: 32,
              right: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topIntroAuthenticate(
                  context: context,
                  des1: "Hello User,",
                  des2: "Tell me more about you.",
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF292929),
                        ),
                        child: const Icon(
                          CupertinoIcons.person_alt,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF52bf92),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
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
                      hintText: "Username",
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        size: 20,
                        color: Color(0xFFf2f4f9),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292929),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    autofocus: false,
                    validator: (val) {},
                    cursorColor: const Color(0xFFf2f4f9),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Bio",
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        CupertinoIcons.pencil_outline,
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
                    route: LoginPage.routeName,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
