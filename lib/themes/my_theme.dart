import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';

ThemeData myTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Acme",
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.buttonForeground
    ),
    titleMedium: TextStyle(
      fontFamily: "Acme",
      fontSize: 27,
      color: Colors.black87
    ),
    bodyLarge: TextStyle(
      fontFamily: "Acme",
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.buttonForeground,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Acme",
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.shadowColor,
    ),
  ),
);