import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/pages/Final%20Page/last_page.dart';
import 'package:login/pages/Login/login.dart';
import 'package:login/pages/Signup/signup.dart';

class SwapPage extends StatefulWidget {
  final bool login;
  const SwapPage({Key? key, required this.login}) : super(key: key);

  @override
  State<SwapPage> createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  bool showLogin = true;

  @override
  void initState() {
    super.initState();
    if (widget.login) {
      setState(() {
        showLogin = true;
      });
    } else {
      setState(() {
        showLogin = false;
      });
    }
  }

  void toggleScreen() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(changePage: toggleScreen)
        : SignUp(changePage: toggleScreen);
  }
}
