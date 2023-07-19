import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/screens/home_screen.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';

class InitialScreen extends StatelessWidget {

  const InitialScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: SingleChildScrollView(
             child: Column(
              children: [
                const SizedBox(height: 100,),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset('assets/img/rick_and_morty_logo-name.png'),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 380,
                  child: Image.asset(
                    'assets/img/logo_initial.png',
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    ),
                ),
                Padding(padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      }));
                    },
                    style: AppColors.buttonStyle, 
                    child: Text(
                      'Enter',
                      style: Theme.of(context).textTheme.titleLarge
                      ),
                    ),  
                  ),
              ],
             ),
           ),
       );
  }
}