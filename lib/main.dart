import 'package:challengeapp/views/authentication/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DoIt",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1c1c1c),
        primaryColor: const Color(0xFF57dea6),
      ),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Wrapper();
          }
          return Container(
            color: const Color(0xFF15151a),
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF4681fd)),
              ),
            ),
          );
        },
      ),
      // routes: {
      //   Wrapper.routeName: (ctx) => const Wrapper(),
      //   HomePage.routeName: (ctx) => const HomePage(),
      //   LoginPage.routeName: (ctx) => LoginPage(),
      //   RegisterPage.routeName: (ctx) => const RegisterPage(),
      //   UserDetailsPage.routeName: (ctx) => const UserDetailsPage(),
      //   PhoneValidPage.routeName: (ctx) => const PhoneValidPage(),
      // },
    );
  }
}
