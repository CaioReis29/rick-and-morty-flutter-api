import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/initial_screen.dart';
import 'package:rick_and_morty_app/themes/my_theme.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: myTheme,
      home: const InitialScreen(),
    );
  }
}

