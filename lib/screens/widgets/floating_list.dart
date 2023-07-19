import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/model/character.dart';
import 'package:rick_and_morty_app/screens/widgets/show_episodes.dart';

class FloatingList extends StatelessWidget {

  const FloatingList({ super.key, required this.character});

  final Character character;

    @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
       showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return ShowEpisodes(character: character);
          },
        );
      },
      backgroundColor: const Color.fromARGB(255, 188, 189, 187),
      label: const Text(
        'Episodes',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      icon: const Icon(
        Icons.ondemand_video,
        size: 20,
        color: Colors.redAccent,
      ),
    );
  }
}