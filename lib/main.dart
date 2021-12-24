import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/authentication/phone_valid_page.dart';
import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:challengeapp/views/authentication/user_details_page.dart';
import 'package:challengeapp/views/authentication/wrapper.dart';
import 'package:challengeapp/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      initialRoute: Wrapper.routeName,
      routes: {
        Wrapper.routeName: (ctx) => const Wrapper(),
        HomePage.routeName: (ctx) => const HomePage(),
        LoginPage.routeName: (ctx) => const LoginPage(),
        RegisterPage.routeName: (ctx) => const RegisterPage(),
        UserDetailsPage.routeName: (ctx) => const UserDetailsPage(),
        PhoneValidPage.routeName: (ctx) => const PhoneValidPage(),
      },
    );
  }
}
