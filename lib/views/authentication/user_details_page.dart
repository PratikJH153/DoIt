import 'dart:io';

import 'package:challengeapp/database/auth.dart';
import 'package:challengeapp/database/database.dart';
import 'package:challengeapp/views/authentication/login_page.dart';
import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:challengeapp/widgets/asking_user_authentication.dart';
import 'package:challengeapp/widgets/top_intro_authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDetailsPage extends StatefulWidget {
  static const routeName = "/userdetails";
  final String email;
  final String password;
  const UserDetailsPage({
    required this.email,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  File? imagefile;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.getImage(source: ImageSource.gallery).catchError((err) {
      print("ERROR WHILE PICKING THE IMAGE $err");
    });

    if (pickedFile != null) {
      setState(() {
        imagefile = File(pickedFile.path);
      });
    } else {
      print("NO IMAGE PICKED");
    }
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });

      await _authService
          .signUpWithEmailAndPassword(
        widget.email.trim(),
        widget.password.trim(),
        context,
      )
          .then((User user) async {
        String profileUrl;
        if (imagefile != null) {
          profileUrl = await _databaseService.uploadImage(imagefile!);
        } else {
          profileUrl = "NO";
        }
        user.updateEmail(widget.email.trim());
        user.updateProfile(
          displayName: _usernameController.text.trim(),
          photoURL: profileUrl,
        );
        user.reload();
        _uploadData(user, profileUrl);

        Navigator.pop(context);
      }).catchError((err) {
        print("ERRROROR : $err");

        setState(() {
          isLoading = false;
        });
      });
    } else {}

    setState(() {
      isLoading = false;
    });
  }

  void _uploadData(
    User user,
    String profileUrl,
  ) async {
    Map<String, dynamic> userData = {
      "id": user.uid,
      "username": _usernameController.text[0].toUpperCase() +
          _usernameController.text.trim().substring(1),
      "email": widget.email.trim(),
      "bio": _bioController.text.trim(),
      "dateTime": Timestamp.now(),
      "profileUrl": profileUrl,
    };
    await _databaseService.addUserData(user.uid, userData).catchError((err) {
      print("ERROR WHILE UPLOADIING USER DATA : $err");
    });
    print("UPLOADING DATA");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton.extended(
            backgroundColor: const Color(0xFF52bf92),
            onPressed: _register,
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
                GestureDetector(
                  onTap: getImage,
                  child: Container(
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
                          child: imagefile == null
                              ? const Icon(
                                  CupertinoIcons.person_alt,
                                  size: 40,
                                  color: Colors.grey,
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(imagefile!),
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
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF292929),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: _usernameController,
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
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
                          controller: _bioController,
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
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 18),
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
