import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

String generateExceptionMessage(err) {
  String errorMessage;
  switch (err.code) {
    case "invalid-email":
      errorMessage = "Your email address appears to be malformed.";
      break;
    case "wrong-password":
      errorMessage = "Your password is wrong.";
      break;
    case "user-not-found":
      errorMessage = "User with this email doesn't exist.";
      break;
    case "email-already-in-use":
      errorMessage =
          "The email has already been registered. Please login or reset your password.";
      break;

    default:
      errorMessage = "An undefined Error happened.";
  }

  return errorMessage;
}

void errorPrompt(var err, BuildContext context) {
  final String errorMessage = generateExceptionMessage(err);
  print(err);
  print('ERRIOUOIUO : $errorMessage');
}

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> loginWithEmailAndPassword(
    String _email,
    String _password,
    BuildContext context,
  ) async {
    UserCredential result = await _auth
        .signInWithEmailAndPassword(
      email: _email,
      password: _password,
    )
        .catchError((err) async {
      errorPrompt(err, context);
    });

    return result.user!;
  }

  Future<User> signUpWithEmailAndPassword(
    String _email,
    String _password,
    BuildContext context,
  ) async {
    final UserCredential result = await _auth
        .createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    )
        .catchError((err) async {
      errorPrompt(err, context);
    });
    final User user = result.user!;
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    } else {
      print("Please verify your account");
    }
    return user;
  }

  Future<User> getCurrentUser() async {
    return _auth.currentUser!;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
