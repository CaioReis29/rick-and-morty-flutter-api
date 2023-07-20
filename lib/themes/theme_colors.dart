import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(0, 224, 230, 181);
  static const Color buttonForeground = Color.fromRGBO(0, 181, 204, 1);
  static const Color buttonBackground = Color.fromRGBO(0, 53, 62, 1);
  static const Color shadowColor = Color.fromRGBO(172, 210, 106, 1);

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    elevation: 1, 
    foregroundColor: buttonForeground,
    textStyle: const TextStyle(
      color: buttonBackground,
      fontFamily: "Acme",
      fontSize: 30,
      fontWeight: FontWeight.bold
    ), 
    backgroundColor: buttonBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: const BorderSide(
        color: shadowColor,
        width: 3
      ),
    ),
    );
}