import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/home_screen.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 121, bottom: 30),
              child: Container(
                width: 293,
                height: 116,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/logo_name.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: 240,
                  height: 266,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/logo_initial.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                style: AppColors.buttonStyle,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Text('ENTER'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
