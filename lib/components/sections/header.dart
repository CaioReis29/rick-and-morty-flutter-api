import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';
import '../../model/character.dart';

class Header extends StatelessWidget {
  final Character character;

  const Header({super.key, required this.character });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.shadowColor, AppColors.buttonForeground]
            )
        ),
        child: SizedBox(
          width: double.infinity,
          height: 270,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(character.image),
                  radius: 80,
                ),
                const SizedBox(height: 20,),
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.titleMedium
                ),
                Text(
                  character.location.name,
                  style: const TextStyle(
                    fontFamily: "Acme",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
