import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/pages/Intro%20Page/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Signup and Login',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.rubik().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
    );
  }
}
