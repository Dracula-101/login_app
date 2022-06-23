import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:login/pages/Final%20Page/last_page.dart';
import 'package:login/pages/OTP/otp_page.dart';
import 'package:login/util/snack_bar.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback changePage;
  const LoginPage({Key? key, required this.changePage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool canSeePassword = false;
  String _email = "", _password = "";
  bool emailError = false, passwordError = false;
  bool newLogin = true;
  String name = "", phone = "";
  bool isPressed = false;
  Widget buildLogin(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimationConfiguration.synchronized(
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Let\'s sign you in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                    child: Text(
                      'Welcome back\n you\'ve been missed!!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            _email = value;
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.black54,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.white54,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.white54,
                                width: 2,
                              ),
                            ),
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) {
                            _password = value;
                          },
                          obscureText: !canSeePassword,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.black54,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.white54,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.white54,
                                width: 2,
                              ),
                            ),
                            hintText: "Password",
                            suffixIcon: IconButton(
                              splashRadius: 1,
                              onPressed: () {
                                setState(() {
                                  canSeePassword = !canSeePassword;
                                });
                              },
                              icon: Icon(
                                canSeePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        if (!isPressed) {
                          setState(() {
                            isPressed = true;
                          });
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }

                          checkUserLogin();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: !isPressed
                            ? const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.black,
                              ),
                      )),
                  Center(
                    child: GestureDetector(
                      onTap: widget.changePage,
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Don\'t have a account? ',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return newLogin
              ? const LastPage(title: "You have Already Logged in")
              : FutureBuilder(
                  future: getDetails(),
                  builder: (context, AsyncSnapshot<Widget> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!;
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black54.withOpacity(0.5),
                        ),
                      );
                    }
                  });
        } else {
          return buildLogin(context);
        }
      },
    );
    // : const LastPage(
    //     title: 'You have already Logged in. Log out to try again');
  }

  Future<void> checkUserLogin() async {
    if (_email != '' && _password != '') {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password)
            .then((value) => setState(() {
                  newLogin = false;
                }));
      } on FirebaseAuthException catch (e) {
        showSnackbar(context, e.message!);
        setState(() {
          isPressed = false;
        });
      }
    }
  }

  Future<Widget> getDetails() async {
    var user = FirebaseAuth.instance.currentUser;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((value) {
        name = value.data()!['name'];
        phone = value.data()!['phone'];
      });
    } catch (e) {
      if (mounted) {
        showSnackbar(context, "Something went wrong");
      }
    }
    return OtpPage(name: name, number: phone);
  }
}
