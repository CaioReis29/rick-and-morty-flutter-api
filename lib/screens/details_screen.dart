import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/components/sections/header.dart';
import 'package:rick_and_morty_app/screens/widgets/floating_list.dart';
import 'package:rick_and_morty_app/themes/theme_colors.dart';
import '../model/character.dart';

class DetailsScreen extends StatelessWidget {
  final Character character;

  const DetailsScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> titleToIcon = {
      "Name": CupertinoIcons.person_crop_circle,
      "Status": CupertinoIcons.heart_circle,
      "Specie": Icons.psychology_alt,
      "Gender": Icons.transgender,
      "Origin": Icons.house,
      "Localization": Icons.place,
    };
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingList(character: character),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.return_icon)),
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge,
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
                    title = "Name";
                    description = character.name;
                    break;
                  case 1:
                    title = "Status";
                    description = character.status;
                    break;
                  case 2:
                    title = "Specie";
                    description = character.species;
                    break;
                  case 3:
                    title = "Gender";
                    description = character.gender;
                    break;
                  case 4:
                    title = "Origin";
                    description = character.origin.name;
                    break;
                  case 5:
                    title = "Localization";
                    description = character.location.name;
                    break;
                  default:
                    title = "";
                    description = "";
                }
                return Column(
            children: [
              ListTile(
                leading: Icon(
                  titleToIcon[title],
                  size: 40,
                  color: AppColors.shadowColor,
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge
                ),
                subtitle: Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Acme',
                    fontSize: 20,
                  ),
                ),
              ),
              const Divider(),
            ],
          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
