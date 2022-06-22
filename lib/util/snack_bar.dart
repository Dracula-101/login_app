import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(30),
      backgroundColor: Colors.black,
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: GoogleFonts.rubik().fontFamily,
          ),
        ),
      ),
    ),
  );
}
