import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/sections/header.dart';
import '../model/character.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Acme',
            fontSize: 27,
            color: Color.fromARGB(255, 41, 253, 48),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Header(character: character),
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                String title, description;
                switch (index) {
                  case 0:
                    title = "Name:";
                    description = character.name;
                    break;
                  case 1:
                    title = "Status:";
                    description = character.status;
                    break;
                  case 2:
                    title = "Specie:";
                    description = character.species;
                    break;
                  case 3:
                    title = "Gender:";
                    description = character.gender;
                    break;
                  case 4:
                    title = "Origin:";
                    description = character.origin.name;
                    break;
                  case 5:
                    title = "Localization:";
                    description = character.location.name;
                    break;
                  default:
                    title = "";
                    description = "";
                }
                return ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Acme',
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                    ),
                  ),
                  subtitle: Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Acme',
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
