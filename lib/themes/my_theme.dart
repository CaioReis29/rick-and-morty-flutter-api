import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';

ThemeData myTheme = ThemeData(
  primarySwatch: AppColors.primaryColor,
  primaryColor: AppColors.primaryColor,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Acme",
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),
  ),
);