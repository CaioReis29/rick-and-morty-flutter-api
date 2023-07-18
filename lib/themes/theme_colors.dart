import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryColor = Colors.green;
  static Color buttonForeground = Colors.white;
  static Color buttonBackground = Colors.green;

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    elevation: 0, 
    foregroundColor: buttonForeground, 
    backgroundColor: buttonBackground,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    );
}