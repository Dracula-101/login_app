import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/pages/Final%20Page/last_page.dart';

class SignUp extends StatefulWidget {
  final VoidCallback changePage;
  const SignUp({Key? key, required this.changePage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool nameError = false;
  bool emailError = false;
  bool passError = false;
  bool isPressed = false;
  String _name = "",
      _email = "",
      _password = "",
      _confirmPass = "",
      _phone = "";

  @override
  void dispose() {
    super.dispose();
    _name = "";
    _email = "";
    _password = "";
    _confirmPass = "";
    _phone = "";
  }

  Widget buildSignUp(BuildContext context) {
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
                    'Welcome!',
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
                      'You can register yourself below',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
                          cursorColor: Colors.white,
                          onChanged: (value) {
                            _name = value;
                          },
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
                            hintText: "Name",
                            suffixIcon: nameError
                                ? const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  )
                                : const Text(''),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                            suffixIcon: emailError
                                ? const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  )
                                : const Text(''),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) {
                            _phone = value;
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
                            hintText: "Phone Number",
                            suffixIcon: emailError
                                ? const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  )
                                : const Text(''),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
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
                            hintText: "Password",
                            suffixIcon: passError
                                ? const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  )
                                : const Text(''),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) {
                            _confirmPass = value;
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
                            hintText: "Confirm Password",
                            suffixIcon: passError
                                ? const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  )
                                : const Text(''),
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
                        registerUser();
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
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => widget.changePage(),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Already have a account? ',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
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
          return const LastPage(title: "You have sucessfully signed in!");
        } else {
          return buildSignUp(context);
        }
      },
    );
  }

  Future<void> registerUser() async {
    if (_email.isEmpty ||
        _password != _confirmPass ||
        _password.isEmpty ||
        _confirmPass.isEmpty) {
      setState(() {
        emailError = true;
        isPressed = false;
      });
      if (_name.isEmpty) {
        setState(() {
          nameError = true;
          isPressed = false;
        });
      }
      if (_password != _confirmPass ||
          _password.isEmpty ||
          _confirmPass.isEmpty) {
        setState(() {
          passError = true;
          isPressed = false;
        });
      }
    } else {
      setState(() {
        nameError = false;
        emailError = false;
        passError = false;
        isPressed = false;
      });
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding: const EdgeInsets.all(30),
            backgroundColor: Colors.black,
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                e.message.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: GoogleFonts.rubik().fontFamily,
                ),
              ),
            ),
          ),
        );
        setState(() {
          isPressed = false;
        });
      }
      addUserDetails();
    }
  }

  Future addUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': _name,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'phone': _phone,
      'email': _email,
    });
  }
}
